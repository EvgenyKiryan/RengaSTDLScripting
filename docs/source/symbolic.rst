Графические примитивы
=====================

К графическим примитивам относятся:

* :ref:`Двумерные кривые <curve2d>`
* :ref:`Двумерные регионы <region>`

.. note:: Двухмерные примитивы в основном используются в условно-графическом отображении оборудования.

* :ref:`Трёхмерные кривые <curve3d>`

.. note:: Трёхмерные кривые в основном используются как направляющие для построения сложных :doc:`3D-тел </geometry>`

.. _curve2d:

Кривые в двумерном пространстве (класс Curve2d)
-----------------------------------------------

Общий класс **Curve2d**, порождающий кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых (см. **Порождающие функции**).

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
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point2d <point2d>`

Дуга окружности по трём точкам
"""""""""""""""""""""""""""""""

Дуга, построенная по начальной точке, конечной и лежащей на дуге точке. Относится к односегментным кривым.

.. function:: ArcBy3Points(point1, point2, point3)

    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку, лежащую на дуге.
    :type point2: :ref:`Point2d <point2d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point2d <point2d>`

Дуга окружности по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Дуга, построенная по центру окружности, начальной и конечной точке. Относится к односегментным кривым.

.. function:: ArcByCenter(center, point1, point2, clockwise)

    :param center: Задает точку центра дуги.
    :type center: :ref:`Point2d <point2d>`
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2d <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Архимедова спираль
""""""""""""""""""

Многосегментный контур. Кривая, образованная точкой, равномерно движущейся по радиусу-вектору, который в то же время равномерно вращается вокруг неподвижной точки.

.. function:: ArchimedeanSpiral(center, begin_radius, end_radius, begin_angle, end_angle)

    :param center: Задает точку центра спирали.
    :type center: :ref:`Point2d <point2d>`
    :param begin_radius: Задает радиус начала спирали.
    :type begin_radius: Number
    :param end_radius: Задает радиус конца спирали.
    :type end_radius: Number
    :param begin_angle: Задает угол начала спирали.
    :type begin_angle: Number
    :param end_angle: Задает угол конца спирали.
    :type end_angle: Number

Окружность
""""""""""

Замкнутая кривая, все точки которой равноудалены от заданной точки. Относится к односегментным кривым.

.. function:: Circle(center, radius)

    :param center: Задает центр окружности.
    :type center: :ref:`Point2d <point2d>`
    :param radius: Задает радиус окружности.
    :type radius: Number

Замкнутый контур по точкам
""""""""""""""""""""""""""

Многосегментный замкнутый контур, состоящий из сегментов-линий.

.. function:: ClosedContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Эллипс
""""""

Замкнутая кривая. Относится к односегментным кривым.

.. function:: Ellipse(center, half_radius_x, half_radius_y)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2d <point2d>`
    :param half_radius_x: Задает радиус полуоси вдоль оси X.
    :type half_radius_x: Number
    :param half_radius_y: Задает радиус полуоси вдоль оси Y.
    :type half_radius_y: Number

Дуга эллипса
""""""""""""

Односегментная кривая.

.. function:: EllipticalArcByCenter(center, half_radius_x, half_radius_y, point1, point2, clockwise)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2d <point2d>`
    :param half_radius_x: Задает радиус полуоси вдоль оси X.
    :type half_radius_x: Number
    :param half_radius_y: Задает радиус полуоси вдоль оси Y.
    :type half_radius_y: Number
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`   
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2d <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Открытый контур по точкам
""""""""""""""""""""""""""

Многосегментный не замкнутый контур, состоящий из сегментов-линий.

.. function:: OpenContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

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

Общие методы двухмерных кривых Curve2d

* Сместить по осям X, Y

.. function:: :shift(d_x, d_y)

    :param d_x: Задает смещение по оси X.
    :type d_x: Number
    :param d_y: Задает смещение по оси Y.
    :type d_y: Number

* Повернуть на угол вокруг точки

.. function:: :rotate(point, angle)

    :param point: Задает точку вращения.
    :type point: :ref:`Point2d <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. function:: :scale(point, x_scale, y_scale)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2d <point2d>`
    :param x_scale: Задает коэффициент масштабирования по оси X.
    :type x_scale: Number
    :param y_scale: Задает коэффициент масштабирования по оси Y.
    :type y_scale: Number

* Изменить направление кривой на противоположное

.. function:: :inverse()

    :return: Инвертированная кривая
    :rtype: :ref:`Point2d <point2d>`

* Скруглить все сегменты контура

.. function:: :fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Скруглить два соседних сегмента кривой

.. function:: :fillet_nth(segment_index, radius)

    :param segment_index: Задает индекс (порядковый номер) сегмента (вершины?) кривой.
    :type segment_index: Number
    :param radius: Задает радиус скругления.
    :type radius: Number

* Обрезать кривую по двум точкам

.. function:: :cut(begin_point, end_point)

    :param begin_point: Задает первую точку.
    :type begin_point: :ref:`Point2d <point2d>`
    :param end_point: Задает вторую точку.
    :type end_point: :ref:`Point2d <point2d>`

* Вернуть начальную точку кривой

.. function:: :begin_point()

    :return: Двухмерная точка
    :rtype: :ref:`Point2d <point2d>`

* Вернуть конечную точку кривой

.. function:: :end_point()

    :return: Двухмерная точка
    :rtype: :ref:`Point2d <point2d>`

* Вернуть ближайшую точку до соседней кривой

.. function:: :nearest_point_for(other_curve)

    :param other_curve: Задает другую кривую.
    :type other_curve: :ref:`Curve2d <curve2d>`

* Вернуть габаритный прямоугольник кривой

.. function:: :bounding_rect()

    :return: Габаритный прямоугольник
    :rtype: :ref:`BoundingRect <boundingrect>`

* Вернуть список точек пересечений кривых Curve1 и Curve2d

.. function:: :intersection_points(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2d <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2d <curve2d>`
    :return: Список точек
    :rtype: set of :ref:`Points2d <point2d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Двухмерная кривая
    :rtype: :ref:`Curve2d <curve2d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Вернуть точку пересения кривых Curve1 и Curve2d.

.. function:: LineIntersection(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2d <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2d <curve2d>`
    :return: Двухмерная точка.
    :rtype: :ref:`Point2d <point2d>`

* Обрезать кривые по регионам

.. function:: clip_curves_by_regions({clipped_curves}, {clipper_regions}, invertRegions, cutOnCurve)

    :param {clipped_curves}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clipped_curves}: table of :ref:`Curves2d <curve2d>`
    :param {clipper_regions}: Задает таблицу регионов, по которым обрезать.
    :type {clipper_regions}: table of :ref:`Regions <region>`
    :param invertRegions: Инвертировать регионы.
    :type invertRegions: boolean
    :param cutOnCurve: Если False, не удаляются части кривой, совпадающие с участками границы.
    :type cutOnCurve: boolean
    :return: Односегментные кривые
    :rtype: table of :ref:`Curves2d <curve2d>`

.. _region:

Двумерный регион (класс Region)
-------------------------------

Регион состоит из замкнутых многосегментных контуров. Регион представляет собой связное множество точек двумерного пространства, границы которого описывают контуры. Контуры региона замкнуты и не имеют самопересечений (но могут иметь самокасания). В произвольном регионе обязан быть один (и только один) внешний контур (положительный обход внешнего контура осуществляется против часовой стрелки) и несколько внутренних контуров (положительный обход внутреннего контура осуществляется по часовой стрелке), которые полностью лежат внутри внешнего контура (или могут его касаться). В массиве ``contours`` первым всегда лежит внешний контур.

Конструктор класса:

.. function:: Region({contours})

    :param contours: Задает таблицу замкнутых кривых (многосегментных контуров).
    :type contours: table of :ref:`Curves2d <curve2d>`

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. function:: :shift(d_x, d_y)

    :param d_x: Задает смещение по оси X.
    :type d_x: Number
    :param d_y: Задает смещение по оси Y.
    :type d_y: Number

* Повернуть относительно точки

.. function:: :rotate(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2d <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. function:: :scale(point, x_scale, y_scale)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2d <point2d>`
    :param x_scale: Задает коэффициент масштабирования по оси X.
    :type x_scale: Number
    :param y_scale: Задает коэффициент масштабирования по оси Y.
    :type y_scale: Number

* Вернуть количество контуров в регионе

.. function:: :contour_count()

    :rtype: Number

* Вернуть контур с индексом index

.. function:: :contour(index)

    :param index: Задает индекс контура.
    :type index: Number
    :return: Многосегментный контур.
    :rtype: :ref:`Curve2d <curve2d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3d <curve3d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Обрезать регионы по регионам

.. function:: clip_regions_by_regions({clipped_regions}, {clipper_regions})

    :param {clipped_regions}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clipped_regions}: table of :ref:`Regions <region>`
    :param {clipper_regions}: Задает таблицу регионов, по которым обрезать.
    :type {clipper_regions}: table of :ref:`Regions <region>`
    :return: Обрезанные регионы.
    :rtype: table of :ref:`Regions <region>`

.. _curve3d:

Кривые в трехмерном пространстве (класс Curve3d)
------------------------------------------------

Общий класс **Curve3d**, порождающий трёхмерные кривые. Не имеет конструктора, но включает в себя функции, создающие различные виды кривых.

Порождающие функции
^^^^^^^^^^^^^^^^^^^

Линия по трем точкам
""""""""""""""""""""

Конструктор:

.. function:: Line3d(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point3d <point3d>`

Дуга окружности по центру, начальной и конечной точкам
""""""""""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Arc3dByCenterAndTwoPoints(point1, point2, point3)

    :param point1: Задает точку центра дуги.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает точку начала дуги.
    :type point2: :ref:`Point3d <point3d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point3d <point3d>`

Трёхмерная кривая по плоской кривой и ЛСК
"""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Curve3dByCurveAndPlacement(curve, placement)

    :param curve: Задает плоскую кривую.
    :type curve: :ref:`Curve2d <curve3d>`
    :param placement: Задает локальную систему координат.
    :type placement: :ref:`Placement3d <placement3d>`

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

Общие методы трёхмерных кривых Curve3d

* Сместить по осям X, Y, Z

.. function:: :shift(d_x, d_y, d_z)

    :param d_x: Задает смещение по оси X.
    :type d_x: Number
    :param d_y: Задает смещение по оси Y.
    :type d_y: Number
    :param d_z: Задает смещение по оси Z.
    :type d_z: Number

* Повернуть относительно оси

.. function:: :rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis <axis>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Вернуть центр кривой

.. function:: :center()

    :return: Трёхмерная точка
    :rtype: :ref:`Point3d <point3d>`

* Скруглить все сегменты кривой

.. function:: :fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: Number

* Вернуть начальную точку кривой

.. function:: :begin_point()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3d <point3d>`


* Вернуть конечную точку кривой

.. function:: :end_point()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3d <point3d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3d <curve3d>`
