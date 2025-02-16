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

.. lua:function:: CreateLineSegment2D(startPoint, endPoint)

    :param startPoint: Задает точку начала линии.
    :type startPoint: :ref:`Point2D <point2d>`
    :param endPoint: Задает точку конца линии.
    :type endPoint: :ref:`Point2D <point2d>`

Дуга окружности по трём точкам
"""""""""""""""""""""""""""""""

Дуга, построенная по начальной точке, конечной и лежащей на дуге точке. Относится к односегментным кривым.

.. lua:function:: CreateArc2DByThreePoints(startPoint, centerPoint, endPoint)

    :param startPoint: Задает точку начала дуги.
    :type startPoint: :ref:`Point2D <point2d>`
    :param centerPoint: Задает точку, лежащую на дуге.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point2D <point2d>`

Дуга окружности по центру, начальной точке и конечной точке
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Дуга, построенная по центру окружности, начальной и конечной точке. Относится к односегментным кривым.

.. lua:function:: CreateArc2DByCenterStartEndPoints(centerPoint, startPoint, endPoint, clockwise)

    :param centerPoint: Задает точку центра дуги.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param startPoint: Задает точку начала дуги.
    :type startPoint: :ref:`Point2D <point2d>`
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point2D <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Параметрическая кривая в двумерном пространстве
"""""""""""""""""""""""""""""""""""""""""""""""

Односегментная кривая, описываемая с помощью параметрических функций ``xFunction`` и ``yFunction``. Тип системы координат (:doc:`CoreEnum </coreenums>`) указывается в параметре ``coordinateSystem``. Для определения области параметра кривой используются начальное значение ``tStart`` и конечное значение ``tEnd``.

.. note:: Составление символьных выражений см. официальное руководство `Renga STDL <https://help.rengabim.com/stdl/ru/expressions.html>`_

.. lua:function:: CreateParametricCurve2D(xFunction, yFunction, coordinateSystem, tStart, tEnd)

        :param xFunction: Выражение, описывающее зависимость X-координаты от параметра.
        :type xFunction: Символьное выражение
        :param yFunction: Выражение, описывающее зависимость Y-координаты от параметра.
        :type yFunction: Символьное выражение
        :param coordinateSystem: Задает тип системы координат в двухмерном пространстве.
        :type coordinateSystem: :ref:`CoordinateSystem2D <coordinate_system2d>`
        :param tStart: Задает начальное значение параметра.
        :type tStart: Number
        :param tEnd: Задает конечное значение параметра.
        :type tEnd: Number

Окружность
""""""""""

Замкнутая кривая, все точки которой равноудалены от заданной точки. Относится к односегментным кривым.

.. lua:function:: CreateCircle2D(centerPoint, radius)

    :param centerPoint: Задает центр окружности.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param radius: Задает радиус окружности.
    :type radius: Number

.. _closed_contour:

Полилиния
"""""""""

Контур, состоящий из сегментов-линий. Может быть замкнутым или открытым.

.. lua:function:: CreatePolyline2D({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Эллипс
""""""

Замкнутая кривая. Относится к односегментным кривым.

.. lua:function:: CreateEllipse2D(centerPoint, angle, halfRadiusX, halfRadiusY)

    :param centerPoint: Задает центр эллипса.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота против часовой стрелки относительно центра в радианах.
    :type angle: Number
    :param halfRadiusX: Задает радиус полуоси вдоль оси X.
    :type halfRadiusX: Number
    :param halfRadiusY: Задает радиус полуоси вдоль оси Y.
    :type halfRadiusY: Number

Дуга эллипса по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Односегментная кривая.

.. lua:function:: CreateEllipticalArc2DByCenterStartEndPoints(centerPoint, angle, halfRadiusX, halfRadiusY, startPoint, endPoint, clockwise)

    :param centerPoint: Задает центр эллипса.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param angle: Задает угол начала вращения против часовой стрелки относительно центра в радианах.
    :type angle: :ref:`Point2D <point2d>`    
    :param halfRadiusX: Задает радиус полуоси вдоль оси X.
    :type halfRadiusX: Number
    :param halfRadiusY: Задает радиус полуоси вдоль оси Y.
    :type halfRadiusY: Number
    :param startPoint: Задает точку начала дуги.
    :type startPoint: :ref:`Point2D <point2d>`   
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point2D <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Прямоугольник с центром в начале координат
""""""""""""""""""""""""""""""""""""""""""

Четырёхугольник, у которого все углы прямые. Относится к составным замкнутым кривым.

.. lua:function:: CreateRectangle2D(centerPoint, angle, width, height)

    :param centerPoint: Задает центр прямоугольника.
    :type centerPoint: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота против часовой стрелки относительно центра в радианах.
    :type angle: Number
    :param width: Задает ширину прямоугольника.
    :type width: Number
    :param height: Задает высоту прямоугольника.
    :type height: Number

Составная кривая
""""""""""""""""

Начало каждой кривой должно совпадать с концом предыдущей.

.. lua:function:: CreateCompositeCurve2D({curves})

    :param curves: Задает таблицу двумерных кривых.
    :type curves: table of :ref:`Curves2d <curve2d>`

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
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. lua:method:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в двумерном пространстве.
    :type matrix: :ref:`Matrix2D <matrix2d>`

* Изменить направление кривой на противоположное

.. lua:method:: :Invert()

    :return: Инвертированная двумерная кривая
    :rtype: :ref:`Curve2D <curve2d>`

* Вернуть копию кривой

.. lua:method:: :Clone()

    :return: Копия двумерной кривой
    :rtype: :ref:`Curve2D <curve2d>`

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

    :param otherCurve: Задает другую двумерную кривую.
    :type otherCurve: :ref:`Curve2D <curve2d>`

* Вернуть габаритный прямоугольник кривой

.. lua:method:: :GetBounds()

    :return: Габаритный прямоугольник
    :rtype: :ref:`BoundingRect <boundingrect>`

Операторы
^^^^^^^^^

* Проверить равенство с другой кривой

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой кривой

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Скруглить углы составной кривой

.. lua:method:: FilletCorners2D(curve, radius)

    :param curve: Задает двумерную кривую.
    :type curve: :ref:`Curve2D <curve2d>`
    :param radius: Задает радиус скругления.
    :type radius: Number

* Скруглить два соседних сегмента кривой

.. lua:method:: FilletCornerAfterSegment2D(curve, segmentIndex, radius)

    :param curve: Задает двумерную кривую.
    :type curve: :ref:`Curve2D <curve2d>`
    :param segmentIndex: Задает индекс (порядковый номер) сегмента кривой.
    :type segmentIndex: Number
    :param radius: Задает радиус скругления.
    :type radius: Number

* Вернуть список точек пересения кривых Curve1 и Curve2.

.. lua:function:: IntersectCurves2D(first, second, includeTouch)

    :param first: Задает первую двумерную кривую.
    :type first: :ref:`Curve2D <curve2d>`
    :param second: Задает вторую двумерную кривую.
    :type second: :ref:`Curve2D <curve2d>`
    :param includeTouch: Включать точки касания (true/false).
    :type includeTouch: Boolean
    :return: Двухмерная точка.
    :rtype: :ref:`Point2D <point2d>`

* Обрезать кривые по контурам

.. lua:function:: ClipCurvesByRegions({clippedCurves}, {clipperRegions}, invertRegions, cutOnCurve)

    :param {clippedCurves}: Задает таблицу двумерных кривых, которые необходимо обрезать.
    :type {clippedCurves}: table of :ref:`Curves2D <curve2d>`
    :param {clipperRegions}: Задает таблицу двумерных контуров, по которым обрезать.
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

Область заливки состоит из набора замкнутых составных контуров. Область заливки — это связное множество точек двумерного пространства, границы которого описывают контуры. Контуры региона замкнуты и не имеют самопересечений (но могут иметь самокасания). В произвольном регионе обязан быть один (и только один) внешний контур ``outerBoundary`` (положительный обход внешнего контура осуществляется против часовой стрелки) и несколько внутренних контуров ``innerBoundaries`` (положительный обход внутреннего контура осуществляется по часовой стрелке), которые полностью лежат внутри внешнего контура (или могут его касаться).

Конструктор класса:

.. lua:function:: FillArea(outerBoundary, {innerBoundaries})

    :param outerBoundary: Задает внешний контур из замкнутого составного контура.
    :type outerBoundary: :ref:`Curve2D <curve2d>`
    :param innerBoundaries: (optional) Задает таблицу замкнутых составных контуров, описывающих внутренние границы области заливки.
    :type innerBoundaries: table of :ref:`Curves2D <curve2d>`

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть относительно точки

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. lua:method:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в двумерном пространстве.
    :type matrix: :ref:`Matrix2D <matrix2d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия контура
    :rtype: :ref:`FillArea <fillarea>`

* Вернуть внутренние границы

.. lua:method:: :GetInnerBoundaries()

    :return: Таблица составных контуров.
    :rtype: table of :ref:`Curves2D <curve2d>`

* Вернуть внешнюю границу

.. lua:method:: :GetOuterBoundary()

    :return: Составной контур.
    :rtype: :ref:`Curve2D <curve2d>`

Операторы
^^^^^^^^^

* Проверить равенство с другим контуром

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другим контуром

.. function:: ~=

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

.. lua:function:: CreateLineSegment3D(startPoint, endPoint)

    :param startPoint: Задает точку начала линии.
    :type startPoint: :ref:`Point3D <point3d>`
    :param endPoint: Задает точку конца линии.
    :type endPoint: :ref:`Point3D <point3d>`

Дуга окружности по центру, начальной и конечной точкам
""""""""""""""""""""""""""""""""""""""""""""""""""""""

.. lua:function:: CreateArc3DByThreePoints(startPoint, centerPoint, endPoint)

    :param startPoint: Задает точку центра дуги.
    :type startPoint: :ref:`Point3D <point3d>`
    :param centerPoint: Задает точку начала дуги.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point3D <point3d>`

Дуга окружности по центру, начальной точке и конечной точке
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Дуга, построенная по центру окружности, начальной и конечной точке в трёхмерном пространстве. Относится к односегментным кривым.

.. lua:function:: CreateArc3DByCenterStartEndPoints(centerPoint, startPoint, endPoint, counterClockwise)

    :param centerPoint: Задает точку центра дуги.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param startPoint: Задает точку начала дуги.
    :type startPoint: :ref:`Point3D <point3d>`
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point3D <point3d>`
    :param counterClockwise: Задает направление дуги. True - против часовой стрелки, False - по часовой стрелке.
    :type counterClockwise: Boolean

Окружность в трёхмерном пространстве
""""""""""""""""""""""""""""""""""""

.. lua:function:: CreateCircle3D(centerPoint, normal, radius)

    :param centerPoint: Задает центр окружности.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param normal: Задает вектор, ортогональный плоскости фигуры.
    :type normal: :ref:`Vector3D <vector3d>`
    :param radius: Задает радиус.
    :type radius: Number

Эллипс в трёхмерном пространстве
""""""""""""""""""""""""""""""""

.. lua:function:: CreateEllipse3D(centerPoint, normal, majorVector, majorRadius, minorRadius)

    :param centerPoint: Задает центр эллипса.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param normal: Задает вектор, ортогональный плоскости фигуры.
    :type normal: :ref:`Vector3D <vector3d>`
    :param majorVector: Задает вектор, сонаправленный с первой полуосью. Вторая полуось сонаправлена с векторным произведением ``normal * majorVector``.
    :type majorVector: :ref:`Vector3D <vector3d>`    
    :param majorRadius: Задает радиус первой полуоси.
    :type majorRadius: Number
    :param minorRadius: Задает радиус второй полуоси.
    :type minorRadius: Number

Дуга эллипса по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Односегментная кривая в трёхмерном пространстве.

.. lua:function:: CreateEllipticalArc3D(centerPoint, normal, majorVector, majorRadius, minorRadius, startPoint, endPoint, clockwise)

    :param centerPoint: Задает центр эллипса.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param normal: Задает вектор, ортогональный плоскости фигуры.
    :type normal: :ref:`Vector3D <vector3d>`
    :param majorVector: Задает вектор, сонаправленный с первой полуосью. Вторая полуось сонаправлена с векторным произведением ``normal * majorVector``.
    :type majorVector: :ref:`Vector3D <vector3d>`    
    :param majorRadius: Задает радиус первой полуоси.
    :type majorRadius: Number
    :param minorRadius: Задает радиус второй полуоси.
    :type minorRadius: Number
    :param startPoint: Задает точку начала дуги.
    :type startPoint: :ref:`Point3D <point3d>`   
    :param endPoint: Задает точку конца дуги.
    :type endPoint: :ref:`Point3D <point3d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Трёхмерная составная кривая
"""""""""""""""""""""""""""

Начало каждой кривой должно совпадать с концом предыдущей.

.. lua:function:: CreateCompositeCurve3D({curves})

    :param curves: Задает таблицу трёхмерных кривых.
    :type curves: table of :ref:`Curves3d <curve3d>`

Полилиния в трёхмерном пространстве
"""""""""""""""""""""""""""""""""""

Контур, состоящий из сегментов-линий. Может быть замкнутым или открытым.

.. lua:function:: CreatePolyline3D({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points3d <point3d>`

Параметрическая кривая в трёхмерном пространстве
""""""""""""""""""""""""""""""""""""""""""""""""

Односегментная кривая, описываемая с помощью параметрических функций ``xFunction`` и ``yFunction``. Тип системы координат (:doc:`CoreEnum </coreenums>`) указывается в параметре ``coordinateSystem``. Для определения области параметра кривой используются начальное значение ``tStart`` и конечное значение ``tEnd``.

.. note:: Составление символьных выражений см. официальное руководство `Renga STDL <https://help.rengabim.com/stdl/ru/expressions.html>`_

.. lua:function:: CreateParametricCurve3D(xFunction, yFunction, yFunction, coordinateSystem, tStart, tEnd, placement)

        :param xFunction: Выражение, описывающее зависимость X-координаты от параметра.
        :type xFunction: Символьное выражение
        :param yFunction: Выражение, описывающее зависимость Y-координаты от параметра.
        :type yFunction: Символьное выражение
        :param zFunction: Выражение, описывающее зависимость Z-координаты от параметра.
        :type zFunction: Символьное выражение
        :param coordinateSystem: Задает тип системы координат в трёхмерном пространстве.
        :type coordinateSystem: :ref:`CoordinateSystem3D <coordinate_system3d>`
        :param tStart: Задает начальное значение параметра.
        :type tStart: Number
        :param tEnd: Задает конечное значение параметра.
        :type tEnd: Number
        :param placement: (optional) Задает координатную плоскость. Если система координат не задана, то для построения используется глобальная система координат.
        :type placement: :ref:`Placement3D <placement3d>`

Прямоугольник с центром в начале координат
""""""""""""""""""""""""""""""""""""""""""

Четырёхугольник, у которого все углы прямые, в трёхмерном пространстве. Относится к составным замкнутым кривым.

.. lua:function:: CreateRectangle3D(centerPoint, normal, widthVector, width, height)

    :param centerPoint: Задает центр прямоугольника.
    :type centerPoint: :ref:`Point3D <point3d>`
    :param normal: Задает вектор, ортогональный плоскости фигуры.
    :type normal: :ref:`Vector3D <vector3d>`
    :param majorVector: Задает вектор, сонаправленный с первой полуосью. Вторая полуось сонаправлена с векторным произведением ``normal * majorVector``.
    :type majorVector: :ref:`Vector3D <vector3d>` 
    :param width: Задает ширину прямоугольника.
    :type width: Number
    :param height: Задает высоту прямоугольника.
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
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в трёхмерном пространстве.
    :type matrix: :ref:`Matrix3D <matrix3d>`

* Изменить направление кривой на противоположное

.. lua:method:: :Invert()

    :return: Инвертированная трёхмерная кривая
    :rtype: :ref:`Curve3D <curve3d>`

* Вернуть копию кривой

.. lua:method:: :Clone()

    :return: Копия трёхмерной кривой
    :rtype: :ref:`Curve3D <curve3d>`

* Обрезать трёхмерную кривую по двум точкам

.. lua:method:: :Trim(startPoint, endPoint)

    :param startPoint: Задает первую точку.
    :type startPoint: :ref:`Point3D <point3d>`
    :param endPoint: Задает вторую точку.
    :type endPoint: :ref:`Point3D <point3d>`

* Вернуть начальную точку кривой

.. lua:method:: :GetStartPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`


* Вернуть конечную точку кривой

.. lua:method:: :GetEndPoint()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3D <point3d>`

Операторы
^^^^^^^^^

* Проверить равенство с другим трёхмерным контуром

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другим трёхмерным контуром

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Скруглить углы составной трёхмерной кривой

.. lua:method:: FilletCorners3D(curve, radius)

    :param curve: Задает трёхмерную кривую.
    :type curve: :ref:`Curve3D <curve3d>`
    :param radius: Задает радиус скругления.
    :type radius: Number

* Скруглить два соседних сегмента трёхмерной кривой

.. lua:method:: FilletCornerAfterSegment3D(curve, segmentIndex, radius)

    :param curve: Задает трёхмерную кривую.
    :type curve: :ref:`Curve3D <curve3d>`
    :param segmentIndex: Задает индекс (порядковый номер) сегмента кривой.
    :type segmentIndex: Number
    :param radius: Задает радиус скругления.
    :type radius: Number