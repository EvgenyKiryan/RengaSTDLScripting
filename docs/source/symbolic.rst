Графические примитивы
=====================

К графическим примитивам относятся:

* :ref:`Двумерные кривые <curve2d>`
* :ref:`Двумерные регионы <region>`

.. note:: Двухмерные примитивы в основном используются в условно-графическом отображении оборудования.

* :ref:`Трёхмерные кривые <curve3d>`

.. note:: Трёхмерные кривые в основном используются как направляющие для построения сложных :doc:`3D-тел </geometry>`

.. _curve2d:

Кривые в двумерном пространстве (класс Curve2D)
-----------------------------------------------

Общий класс **Curve2D**, порождающий кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых (см. **Порождающие функции**).

Кривые могут быть:

* Односегментные (линии, дуги)
* Многосегментные (контуры)

Порождающие функции
^^^^^^^^^^^^^^^^^^^

Линия по двум точкам
""""""""""""""""""""

Отрезок прямой, построенной по двум точкам. Относится к односегментным кривым.

.. function:: Line(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point2D <point2d>`

Дуга окружности по трём точкам
"""""""""""""""""""""""""""""""

Дуга, построенная по начальной точке, конечной и лежащей на дуге точке. Относится к односегментным кривым.

.. function:: ArcBy3Points(point1, point2, point3)

    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает точку, лежащую на дуге.
    :type point2: :ref:`Point2D <point2d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point2D <point2d>`

Дуга окружности по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Дуга, построенная по центру окружности, начальной и конечной точке. Относится к односегментным кривым.

.. function:: ArcByCenter(center, point1, point2, clockwise)

    :param center: Задает точку центра дуги.
    :type center: :ref:`Point2D <point2d>`
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2D <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Архимедова спираль
""""""""""""""""""

Многосегментный контур. Кривая, образованная точкой, равномерно движущейся по радиусу-вектору, который в то же время равномерно вращается вокруг неподвижной точки.

.. function:: ArchimedeanSpiral(center, beginRadius, endRadius, beginAngle, endAngle)

    :param center: Задает точку центра спирали.
    :type center: :ref:`Point2D <point2d>`
    :param beginRadius: Задает радиус начала спирали.
    :type beginRadius: Number
    :param endRadius: Задает радиус конца спирали.
    :type endRadius: Number
    :param beginAngle: Задает угол начала спирали.
    :type beginAngle: Number
    :param endAngle: Задает угол конца спирали.
    :type endAngle: Number

Окружность
""""""""""

Замкнутая кривая, все точки которой равноудалены от заданной точки. Относится к односегментным кривым.

.. function:: Circle(center, radius)

    :param center: Задает центр окружности.
    :type center: :ref:`Point2D <point2d>`
    :param radius: Задает радиус окружности.
    :type radius: Number

.. _closed_contour:

Замкнутый контур по точкам
""""""""""""""""""""""""""

Многосегментный замкнутый контур, состоящий из сегментов-линий.

.. function:: ClosedContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Эллипс
""""""

Замкнутая кривая. Относится к односегментным кривым.

.. function:: Ellipse(center, halfRadiusX, halfRadiusY)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2D <point2d>`
    :param halfRadiusX: Задает радиус полуоси вдоль оси X.
    :type halfRadiusX: Number
    :param halfRadiusY: Задает радиус полуоси вдоль оси Y.
    :type halfRadiusY: Number

Дуга эллипса
""""""""""""

Односегментная кривая.

.. function:: EllipticalArcByCenter(center, halfRadiusX, halfRadiusY, point1, point2, clockwise)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2D <point2d>`
    :param halfRadiusX: Задает радиус полуоси вдоль оси X.
    :type halfRadiusX: Number
    :param halfRadiusY: Задает радиус полуоси вдоль оси Y.
    :type halfRadiusY: Number
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2D <point2d>`   
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2D <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Открытый контур по точкам
""""""""""""""""""""""""""

Многосегментный не замкнутый контур, состоящий из сегментов-линий.

.. function:: OpenContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2D <point2d>`

Прямоугольник с центром в начале координат
""""""""""""""""""""""""""""""""""""""""""

Четырёхугольник, у которого все углы прямые. Относится к многосегментным замкнутым кривым.

.. function:: Rectangle(width, height)

    :param width: Задает ширину прямоугольника.
    :type width: Number
    :param height: Задает высоту прямоугольника.
    :type height: Number

Методы класса
^^^^^^^^^^^^^

Общие методы двухмерных кривых Curve2D

* Сместить по осям X, Y

.. function:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть на угол вокруг точки

.. function:: :Rotate(point, angle)

    :param point: Задает точку вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. function:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Изменить направление кривой на противоположное

.. function:: :Inverse()

    :return: Инвертированная кривая
    :rtype: :ref:`Curve2D <curve2d>`

* Скруглить все сегменты контура

.. function:: :Fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Скруглить два соседних сегмента кривой

.. function:: :FilletNth(segmentIndex, radius)

    :param segmentIndex: Задает индекс (порядковый номер) сегмента (вершины?) кривой.
    :type segmentIndex: Number
    :param radius: Задает радиус скругления.
    :type radius: Number

* Обрезать кривую по двум точкам

.. function:: :Cut(beginPoint, endPoint)

    :param beginPoint: Задает первую точку.
    :type beginPoint: :ref:`Point2D <point2d>`
    :param endPoint: Задает вторую точку.
    :type endPoint: :ref:`Point2D <point2d>`

* Вернуть начальную точку кривой

.. function:: :BeginPoint()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть конечную точку кривой

.. function:: :EndPoint()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть ближайшую точку до соседней кривой

.. function:: :NearestPointFor(otherCurve)

    :param otherCurve: Задает другую кривую.
    :type otherCurve: :ref:`Curve2D <curve2d>`

* Вернуть габаритный прямоугольник кривой

.. function:: :BoundingRect()

    :return: Габаритный прямоугольник
    :rtype: :ref:`BoundingRect <boundingrect>`

* Вернуть список точек пересечений кривых Curve1 и Curve2d

.. function:: :IntersectionPoints(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2D <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2D <curve2d>`
    :return: Список точек
    :rtype: set of :ref:`Points2d <point2d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Двухмерная кривая
    :rtype: :ref:`Curve2D <curve2d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Вернуть точку пересения кривых Curve1 и Curve2.

.. function:: LineIntersection(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2D <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2D <curve2d>`
    :return: Двухмерная точка.
    :rtype: :ref:`Point2D <point2d>`

* Обрезать кривые по регионам

.. function:: ClipCurvesByRegions({clippedCurves}, {clipperRegions}, invertRegions, cutOnCurve)

    :param {clippedCurves}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clippedCurves}: table of :ref:`Curves2D <curve2d>`
    :param {clipperRegions}: Задает таблицу регионов, по которым обрезать.
    :type {clipperRegions}: table of :ref:`Regions <region>`
    :param invertRegions: Инвертировать регионы.
    :type invertRegions: boolean
    :param cutOnCurve: Если False, не удаляются части кривой, совпадающие с участками границы.
    :type cutOnCurve: boolean
    :return: Односегментные кривые
    :rtype: table of :ref:`Curves2D <curve2d>`

.. _region:

Двумерный регион (класс Region)
-------------------------------

Регион состоит из замкнутых многосегментных контуров. Регион представляет собой связное множество точек двумерного пространства, границы которого описывают контуры. Контуры региона замкнуты и не имеют самопересечений (но могут иметь самокасания). В произвольном регионе обязан быть один (и только один) внешний контур (положительный обход внешнего контура осуществляется против часовой стрелки) и несколько внутренних контуров (положительный обход внутреннего контура осуществляется по часовой стрелке), которые полностью лежат внутри внешнего контура (или могут его касаться). В массиве ``contours`` первым всегда лежит внешний контур.

Конструктор класса:

.. function:: Region({contours})

    :param contours: Задает таблицу замкнутых кривых (многосегментных контуров).
    :type contours: table of :ref:`Curves2D <curve2d>`

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. function:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть относительно точки

.. function:: :Rotate(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. function:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Вернуть количество контуров в регионе

.. function:: :ContourCount()

    :rtype: Number

* Вернуть контур с индексом index

.. function:: :Contour(index)

    :param index: Задает индекс контура.
    :type index: Number
    :return: Многосегментный контур.
    :rtype: :ref:`Curve2D <curve2d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3D <curve3d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Обрезать регионы по регионам

.. function:: ClipRegionsByRegions({clippedRegions}, {clipperRegions})

    :param {clippedRegions}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clippedRegions}: table of :ref:`Regions <region>`
    :param {clipperRegions}: Задает таблицу регионов, по которым обрезать.
    :type {clipperRegions}: table of :ref:`Regions <region>`
    :return: Обрезанные регионы.
    :rtype: table of :ref:`Regions <region>`

.. _curve3d:

Кривые в трехмерном пространстве (класс Curve3D)
------------------------------------------------

Общий класс **Curve3D**, порождающий трёхмерные кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых.

Порождающие функции
^^^^^^^^^^^^^^^^^^^

Линия по трем точкам
""""""""""""""""""""

Конструктор:

.. function:: Line3d(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point3D <point3d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point3D <point3d>`

Дуга окружности по центру, начальной и конечной точкам
""""""""""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Arc3dByCenterAndTwoPoints(point1, point2, point3)

    :param point1: Задает точку центра дуги.
    :type point1: :ref:`Point3D <point3d>`
    :param point2: Задает точку начала дуги.
    :type point2: :ref:`Point3D <point3d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point3D <point3d>`

Трёхмерная кривая по плоской кривой и ЛСК
"""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Curve3dByCurveAndPlacement(curve, placement)

    :param curve: Задает плоскую кривую.
    :type curve: :ref:`Curve2D <curve2d>`
    :param placement: Задает локальную систему координат.
    :type placement: :ref:`Placement3D <placement3d>`

Трёхмерная спираль
""""""""""""""""""

.. function:: Helix(radius, step, height)

    :param radius: Задает радиус спирали.
    :type radius: Number
    :param step: Задает расстояние между витками спирали.
    :type step: Number
    :param height: Задает высоту спирали.
    :type height: Number

Методы класса
^^^^^^^^^^^^^

Общие методы трёхмерных кривых Curve3D

* Сместить по осям X, Y, Z

.. function:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть относительно оси

.. function:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis <axis>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Вернуть центр кривой

.. function:: :Center()

    :return: Трёхмерная точка
    :rtype: :ref:`Point3D <point3d>`

* Скруглить все сегменты кривой

.. function:: :Fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Вернуть начальную точку кривой

.. function:: :BeginPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`


* Вернуть конечную точку кривой

.. function:: :EndPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3D <curve3d>`
