-- объявление локальных переменных
local parameters = Style.GetParameterValues()

-- таблицы групп параметров
local general = parameters.General
local lengthwaysRebars = parameters.LengthwaysRebars
local transverseRebars = parameters.TransverseRebars

-- параметры
local meshLength = general.meshLength
local meshWidth = general.meshWidth
local meshOffsetZ = general.meshOffsetZ

local lengthwaysRebarId = lengthwaysRebars.RebarStyleId
local dowelLength = lengthwaysRebars.dowelLength

local transverseRebarId = transverseRebars.RebarStyleId
local transverseRebarFreeEndLength = transverseRebars.freeEndLength
local rebarStep = transverseRebars.rebarStep

-- Функция получения диаметра стиля стержня по его ID
local function GetRebarDiameter(rebarStyleId)
    local style = Project.GetRebarStyle(rebarStyleId)
    local parameters = CastToParameterContainer(style)
    return parameters:GetParameterValues().RebarDiameter
end

-- получаем диаметр продольного стержня
local lengthwaysRebarDiameter = GetRebarDiameter(lengthwaysRebarId)
-- получаем диаметр поперечного стержня
local transverseRebarDiameter = GetRebarDiameter(transverseRebarId)

-- Функция создания направляющей для стержня
local function makeRebarBaseCurve()
    local curve
    
    -- если длина выпусков < 200, то создаем прямые стержни
    if dowelLength < 200 then
        return CreateLineSegment3D(Point3D(0, 0, 0), Point3D(0, 0, meshLength + dowelLength))

    -- иначе - с изгибом для правильного соединения с верхним каркасом
    else
        curve = CreatePolyline3D({Point3D(0, 0, 0),
            Point3D(0, 0, meshLength + 30),
            Point3D(lengthwaysRebarDiameter, 0, meshLength + 170),
            Point3D(lengthwaysRebarDiameter, 0, meshLength + dowelLength)})
        FilletCorners3D(curve, 10*lengthwaysRebarDiameter)
        return curve
    end
end

-- Функция создания продольных стержней
local function CreateLengthwaysRebars(rebarStyleId)
    local firstCurve = makeRebarBaseCurve()
    local secondCurve = makeRebarBaseCurve()

    -- сами стержни двигаться не могут, поэтому перемещаем образующие кривые на свои места
    firstCurve:Shift(-meshWidth/2 + transverseRebarFreeEndLength, 0, meshOffsetZ)
    secondCurve:Rotate(CreateZAxis3D(), math.pi)
        :Shift(meshWidth/2 - transverseRebarFreeEndLength, 0, meshOffsetZ)

    -- добавляем в стиль стержни
    Style.AddRebar(rebarStyleId, firstCurve)
    Style.AddRebar(rebarStyleId, secondCurve)
end

-- Функция создания поперечных стержней
local function CreateTransverseRebars(rebarStyleId)
    -- находим вертикальное смещение первого поперечного стержня
    local rebarOffsetZ = lengthwaysRebars.bottomFreeEndLength + transverseRebarDiameter/2 + meshOffsetZ

    -- находим горизонтальное смещение поперечного стержня относительно продольного
    local rebarOffsetY = (lengthwaysRebarDiameter + transverseRebarDiameter)/2

    -- находим количество поперечных стержней
    local layoutLength = meshLength - rebarOffsetZ - lengthwaysRebars.topFreeEndLength
    local rebarsQty = math.ceil(layoutLength/rebarStep)

    -- создаем направляющую кривую
    local curve = CreateLineSegment3D(Point3D(-meshWidth/2, -rebarOffsetY, rebarOffsetZ),
        Point3D(meshWidth/2, -rebarOffsetY, rebarOffsetZ))

    -- добавляем в стиль набор стержней
    Style.AddRebarSet(rebarStyleId, curve, Vector3D(0, 0, 1), rebarStep, rebarsQty)
end

-- создание продольных стержней
CreateLengthwaysRebars(lengthwaysRebarId)

-- создание поперечных стержней
CreateTransverseRebars(transverseRebarId)

-- создание условного отображения каркаса
-- создание экземпляра ModelGeometry
local symbolicGeometry = ModelGeometry()

-- создание экземпляра планарной геометрии
local geometry = GeometrySet2D()

-- задание ЛСК
local geometryPlacement = Placement3D(Point3D(0, 0, meshOffsetZ), Vector3D(0, -1, 0), Vector3D(1, 0, 0))

local rectangle = CreateRectangle2D(Point2D(0, meshLength/2), 0, meshWidth, meshLength)
local line = CreateLineSegment2D(Point2D(-meshWidth/2, 0), Point2D(meshWidth/2, meshLength))

-- добавление кривых в планарную геометрию
geometry:AddCurve(rectangle):AddCurve(line)

-- добавление планарной геометрии в модельную геометрию
symbolicGeometry:AddGeometrySet2D(geometry, geometryPlacement)

-- создание условной геометрии стиля
Style.SetSymbolicGeometry(symbolicGeometry)