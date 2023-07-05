Графические примитивы
=====================

К графическим примитивам относятся:

* :ref:`Двумерные кривые <curve2d>`
* :ref:`Двумерные контуры <fillarea>`

.. note:: Двухмерные примитивы в основном используются в условно-графическом отображении оборудования.

* :ref:`Трёхмерные кривые <curve3d>`

.. note:: Трёхмерные кривые в основном используются как направляющие для построения сложных :doc:`3D-тел </geometry>`

.. _curve2d:

Кривые в двумерном пространстве (класс Curve2D)
-----------------------------------------------

Общий класс **Curve2D**, порождающий кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых (см. **Порождающие функции**).

Кривые могут быть:

* Односегментные (линии, дуги)
* Составные (контуры)

Порождающие функции
^^^^^^^^^^^^^^^^^^^

Линия по двум точкам
""""""""""""""""""""

Отрезок прямой, построенной по двум точкам. Относится к односегментным кривым.

.. lua:function:: LineSegment(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point2D <point2d>`

Дуга окружности по трём точкам
"""""""""""""""""""""""""""""""

Дуга, построенная по начальной точке, конечной и лежащей на дуге точке. Относится к односегментным кривым.

.. lua:function:: ArcBy3Points(point1, point2, point3)

    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает точку, лежащую на дуге.
    :type point2: :ref:`Point2D <point2d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point2D <point2d>`

Дуга окружности по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Дуга, построенная по центру окружности, начальной и конечной точке. Относится к односегментным кривым.

.. lua:function:: ArcByCenter(center, point1, point2, clockwise)

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

Составной контур. Кривая, образованная точкой, равномерно движущейся по радиусу-вектору, который в то же время равномерно вращается вокруг неподвижной точки.

.. lua:function:: ArchimedeanSpiral(center, beginRadius, endRadius, beginAngle, endAngle)

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

.. lua:function:: Circle(center, radius)

    :param center: Задает центр окружности.
    :type center: :ref:`Point2D <point2d>`
    :param radius: Задает радиус окружности.
    :type radius: Number

.. _closed_contour:

Контур по точкам
""""""""""""""""

Контур, состоящий из сегментов-линий. Может быть замкнутым или открытым.

.. lua:function:: ContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Эллипс
""""""

Замкнутая кривая. Относится к односегментным кривым.

.. lua:function:: Ellipse(center, halfRadiusX, halfRadiusY)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2D <point2d>`
    :param halfRadiusX: Задает радиус полуоси вдоль оси X.
    :type halfRadiusX: Number
    :param halfRadiusY: Задает радиус полуоси вдоль оси Y.
    :type halfRadiusY: Number

Дуга эллипса
""""""""""""

Односегментная кривая.

.. lua:function:: EllipticalArcByCenter(center, halfRadiusX, halfRadiusY, point1, point2, clockwise)

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

Прямоугольник с центром в начале координат
""""""""""""""""""""""""""""""""""""""""""

Четырёхугольник, у которого все углы прямые. Относится к составным замкнутым кривым.

.. lua:function:: Rectangle(width, height)

    :param width: Задает ширину прямоугольника.
    :type width: Number
    :param height: Задает высоту прямоугольника.
    :type height: Number

Методы класса
^^^^^^^^^^^^^

Общие методы двухмерных кривых Curve2D

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть на угол вокруг точки

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. lua:method:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Изменить направление кривой на противоположное

.. lua:method:: :Inverse()

    :return: Инвертированная кривая
    :rtype: :ref:`Curve2D <curve2d>`

* Вернуть копию кривой

.. lua:method:: :Clone()

    :return: Копия кривой
    :rtype: :ref:`Curve2D <curve2d>`

* Скруглить все сегменты контура

.. lua:method:: :FilletCorners(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Скруглить два соседних сегмента кривой

.. lua:method:: :FilletCornerAfterSegment(segmentIndex, radius)

    :param segmentIndex: Задает индекс (порядковый номер) вершины кривой.
    :type segmentIndex: Number
    :param radius: Задает радиус скругления.
    :type radius: Number

* Обрезать кривую по двум точкам

.. lua:method:: :Trim(startPoint, endPoint)

    :param startPoint: Задает первую точку.
    :type startPoint: :ref:`Point2D <point2d>`
    :param endPoint: Задает вторую точку.
    :type endPoint: :ref:`Point2D <point2d>`

* Вернуть начальную точку кривой

.. lua:method:: :GetStartPoint()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть конечную точку кривой

.. lua:method:: :GetEndPoint()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть ближайшую точку до соседней кривой

.. lua:method:: :GetClosestPointTo(otherCurve)

    :param otherCurve: Задает другую кривую.
    :type otherCurve: :ref:`Curve2D <curve2d>`

* Вернуть габаритный прямоугольник кривой

.. lua:method:: :GetBounds()

    :return: Габаритный прямоугольник
    :rtype: :ref:`BoundingRect <boundingrect>`

* Вернуть список точек пересечений кривых Curve1 и Curve2d

.. lua:method:: :IntersectCurve(first, second)

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

.. lua:function:: IntersectLine(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2D <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2D <curve2d>`
    :return: Двухмерная точка.
    :rtype: :ref:`Point2D <point2d>`

* Обрезать кривые по контурам

.. lua:function:: ClipCurvesByRegions({clippedCurves}, {clipperRegions}, invertRegions, cutOnCurve)

    :param {clippedCurves}: Задает таблицу кривых, которые необходимо обрезать.
    :type {clippedCurves}: table of :ref:`Curves2D <curve2d>`
    :param {clipperRegions}: Задает таблицу контуров, по которым обрезать.
    :type {clipperRegions}: table of :ref:`FillAreas <fillarea>`
    :param invertRegions: Инвертировать контуры.
    :type invertRegions: boolean
    :param cutOnCurve: Если False, не удаляются части кривой, совпадающие с участками границы.
    :type cutOnCurve: boolean
    :return: Односегментные кривые
    :rtype: table of :ref:`Curves2D <curve2d>`

.. _fillarea:

Область заливки (класс FillArea)
--------------------------------

Область заливки состоит из набора замкнутых составных контуров. Область заливки — это связное множество точек двумерного пространства, границы которого описывают контуры. Контуры региона замкнуты и не имеют самопересечений (но могут иметь самокасания). В произвольном регионе обязан быть один (и только один) внешний контур (положительный обход внешнего контура осуществляется против часовой стрелки) и несколько внутренних контуров (положительный обход внутреннего контура осуществляется по часовой стрелке), которые полностью лежат внутри внешнего контура (или могут его касаться). В массиве ``contours`` первым всегда лежит внешний контур.

Конструктор класса:

.. lua:function:: FillArea({contours})

    :param contours: Задает таблицу замкнутых составных контуров.
    :type contours: table of :ref:`Curves2D <curve2d>`

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. lua:method:: :ShiftTransform(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть относительно точки

.. lua:method:: :RotateTransform(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. lua:method:: :ScaleTransform(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия контура
    :rtype: :ref:`FillArea <fillarea>`

* Вернуть количество контуров в регионе

.. lua:method:: :GetContourCount()

    :rtype: Number

* Вернуть контур с индексом index

.. lua:method:: :GetContour(index)

    :param index: Задает индекс контура.
    :type index: Number
    :return: Составной контур.
    :rtype: :ref:`Curve2D <curve2d>`

Операторы
^^^^^^^^^

* Сравнить на равенство с другим контуром

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Сравнить на неравенство с другим контуром

.. function:: !=

    :return: Логическое значение
    :rtype: Boolean

.. _curve3d:

Кривые в трехмерном пространстве (класс Curve3D)
------------------------------------------------

Общий класс **Curve3D**, порождающий трёхмерные кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых.

Порождающие функции
^^^^^^^^^^^^^^^^^^^

Линия по двум точкам
""""""""""""""""""""

Конструктор:

.. lua:function:: LineSegment3D(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point3D <point3d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point3D <point3d>`

Дуга окружности по центру, начальной и конечной точкам
""""""""""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. lua:function:: Arc3DByCenterAndTwoPoints(point1, point2, point3)

    :param point1: Задает точку центра дуги.
    :type point1: :ref:`Point3D <point3d>`
    :param point2: Задает точку начала дуги.
    :type point2: :ref:`Point3D <point3d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point3D <point3d>`

Трёхмерная кривая по плоской кривой и плоскости
"""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. lua:function:: Curve3DByCurveAndPlacement(curve, placement)

    :param curve: Задает плоскую кривую.
    :type curve: :ref:`Curve2D <curve2d>`
    :param placement: Задает плоскость расположения 2D-кривой.
    :type placement: :ref:`Placement3D <placement3d>`

Трёхмерная спираль
""""""""""""""""""

.. lua:function:: Helix(radius, step, height)

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

.. lua:method:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть относительно оси

.. lua:method:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis3D <axis3d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Вернуть центр кривой

.. lua:method:: :GetCenter()

    :return: Трёхмерная точка
    :rtype: :ref:`Point3D <point3d>`

* Скруглить все сегменты кривой

.. lua:method:: :FilletCorners(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Вернуть начальную точку кривой

.. lua:method:: :GetStartPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`


* Вернуть конечную точку кривой

.. lua:method:: :GetEndPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`
