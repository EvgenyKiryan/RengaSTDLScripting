Твердотельная 3D-геометрия (класс Solid)
========================================

Общий класс **Solid** не имеет конструктора. Содержит функции, порождающие твердотельную геометрию. Служит для построения 3D-геометрии объектов.

Порождающие функции
-------------------

Куб
^^^

Правильный многогранник, каждая грань которого представляет собой квадрат.

.. function:: Cube(size)

    :param size: Задает размер грани куба.
    :type size: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 1.
    :linenos:

    local solid = renga.Cube(20)

    category.geometry.detailed:add_solid(solid)

Результат:

.. image:: _static/Cube.png
    :height: 230 px
    :width: 400 px
    :align: center

Параллелепипед
^^^^^^^^^^^^^^

Четырехугольная призма, все грани которой являются прямоугольниками (прямоугольный параллелепипед).

.. function:: Box(length, width, height)

    :param length: Задает длину параллелепипеда.
    :type length: Number
    :param width: Задает глубину параллелепипеда.
    :type width: Number
    :param height: Задает высоту параллелепипеда.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 2.
    :linenos:

    local solid = renga.Box(40, 15, 20)

    category.geometry.detailed:add_solid(solid)

Результат:

.. image:: _static/Box.png
    :height: 230 px
    :width: 400 px
    :align: center

Сфера
^^^^^

.. function:: Sphere(radius)

    :param radius: Задает радиус сферы.
    :type radius: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 3.
    :linenos:

    local solid = renga.Sphere(10)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/Sphere.png
    :height: 230 px
    :width: 400 px
    :align: center

Цилиндр
^^^^^^^

Тело, ограниченное цилиндрической поверхностью и двумя параллельными плоскостями, пересекающими её.

.. function:: Cylinder(radius, height)

    :param radius: Задает радиус цилиндра.
    :type radius: Number
    :param height: Задает высоту цилиндра.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 4.
    :linenos:

    local solid = renga.Cylinder(10, 40)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/Cylinder.png
    :height: 230 px
    :width: 400 px
    :align: center

Конус
^^^^^

Прямой конус, основанием которого является окружность и ортогональная проекция вершины конуса на плоскость основания совпадает с этим центром.

.. function:: Cone(radius, height)

    :param radius: Задает радиус конуса.
    :type radius: Number
    :param height: Задает высоту конуса.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 5.
    :linenos:

    local solid = renga.Cone(10, 40)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/Cone.png
    :height: 230 px
    :width: 400 px
    :align: center

Усеченный конус
^^^^^^^^^^^^^^^

Часть конуса, лежащая между основанием и плоскостью, параллельной основанию и находящейся между вершиной и основанием.

.. function:: ConicalFrustum(bottom_radius, top_radius, height)

    :param bottom_radius: Задает радиус основания усеченного конуса.
    :type bottom_radius: Number
    :param top_radius: Задает радиус верха усеченного конуса.
    :type top_radius: Number    
    :param height: Задает высоту усеченного конуса.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 6.
    :linenos:

    local solid = renga.ConicalFrustum(10, 5, 20)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/ConicalFrustum.png
    :height: 230 px
    :width: 400 px
    :align: center

Пирамида с прямоугольным основанием
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Основанием пирамиды является прямоугольник.

.. function:: Pyramid(size_x, size_y, height)

    :param size_x: Задает размер основания пирамиды по оси X.
    :type size_x: Number
    :param size_y: Задает размер основания пирамиды по оси Y.
    :type size_y: Number    
    :param height: Задает высоту пирамиды.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 7.
    :linenos:

    local solid = renga.Pyramid(25, 15, 20)

    category.geometry.detailed:add_solid(solid)

Результат:

.. image:: _static/Pyramid.png
    :height: 230 px
    :width: 400 px
    :align: center

.. _extrusion:

Тело выдавливания
^^^^^^^^^^^^^^^^^

.. function:: Extrusion(contour, height)

    :param contour: Задает плоский контур выдавливания.
    :type contour: :ref:`Curve2d <curve2d>`   
    :param height: Задает высоту тела выдавливания.
    :type height: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 8.
    :linenos:

    local points = {
        renga.Point2d(0, 0),
        renga.Point2d(0, 10),
        renga.Point2d(10, 10),
        renga.Point2d(10, 8),
        renga.Point2d(8, 8),
        renga.Point2d(8, 6),
        renga.Point2d(6, 6),
        renga.Point2d(6, 4),
        renga.Point2d(4, 4),
        renga.Point2d(4, 2),
        renga.Point2d(2, 2),
        renga.Point2d(2, 0)}
    local contour = renga.ClosedContourByPoints(points)
    local solid = renga.Extrusion(contour, 40)

    category.geometry.detailed:add_solid(solid)

Результат:

.. image:: _static/Extrusion.png
    :height: 230 px
    :width: 400 px
    :align: center

Тело выдавливания с толщиной
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: ExtrusionWithThickness(contour, height, thickness)

    :param contour: Задает плоский контур выдавливания.
    :type contour: :ref:`Curve2d <curve2d>`   
    :param height: Задает высоту тела выдавливания.
    :type height: Number
    :param thickness: Задает толщину контура выдавливания.
    :type thickness: Number
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 9.
    :linenos:

    local points = {
        renga.Point2d(0, 0),
        renga.Point2d(0, 10),
        renga.Point2d(10, 10),
        renga.Point2d(10, 8),
        renga.Point2d(8, 8),
        renga.Point2d(8, 6),
        renga.Point2d(6, 6),
        renga.Point2d(6, 4),
        renga.Point2d(4, 4),
        renga.Point2d(4, 2),
        renga.Point2d(2, 2),
        renga.Point2d(2, 0)}
    local contour = renga.ClosedContourByPoints(points)
    local solid = renga.ExtrusionWithThickness(contour, 15, 0.5)

    category.geometry.detailed:add_solid(solid)

Результат:

.. image:: _static/ExtrusionWithThickness.png
    :height: 230 px
    :width: 400 px
    :align: center

Построение тела по плоским сечениям
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: CreateLoftedSolid({profiles}, {placements})

    :param {profiles}: Задает таблицу плоских контуров.
    :type {profiles}: table of :ref:`Curves2d <curve2d>`   
    :param {placements}: Задает таблицу координатных плоскостей в 3D пространстве.
    :type {placements}: table of :ref:`Placements3d <placement3d>`
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 10.
    :linenos:

    local profiles = {
        renga.Rectangle(30, 30),
        renga.Circle(renga.Point2d(0, 0), 10)}
    local placements = {
        renga.Placement3d(renga.Point3d(0, 0, 0),
                              renga.Vector3d(1, 0, 0),
                              renga.Vector3d(0, 1, 0)),
        renga.Placement3d(renga.Point3d(40, 0, 0),
                              renga.Vector3d(1, 0, 0),
                              renga.Vector3d(0, 1, 0))}
    local solid = renga.CreateLoftedSolid(profiles, placements)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/CreateLoftedSolid.png
    :height: 230 px
    :width: 400 px
    :align: center

Построение кинематического тела путем движения образующей кривой вдоль направляющей кривой
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: CreateLoftedSolidByProfilesAndPath(start_profile, end_profile, path)

    :param start_profile: Задает плоский контур в начале.
    :type start_profile: :ref:`Curve2d <curve2d>`   
    :param end_profile: Задает плоский контур в конце.
    :type end_profile: :ref:`Curve2d <curve2d>`
    :param path: Задает путь движения в виде трехмерной кривой.
    :type path: :ref:`Curve3d <curve3d>`
    :return: Твердотельная геометрия.
    :rtype: Solid

.. code-block:: lua
    :caption: Пример 11.
    :linenos:

    local start_profile = renga.Rectangle(30, 30)
    local end_profile = renga.Circle(renga.Point2d(0, 0), 10)
    local arc_2d = renga.ArcByCenter(renga.Point2d(0, 0),
                                         renga.Point2d(-30, 0),
                                         renga.Point2d(0, 30),
                                         true)
    local arc_3d = renga.Curve3dByCurveAndPlacement(arc_2d,
                                                        renga.Placement3d(renga.Point3d(0, 0, 0),
                                                                              renga.Vector3d(0, -1, 0),
                                                                              renga.Vector3d(0, 0, 1)))
    local solid = renga.CreateLoftedSolidByProfilesAndPath(start_profile, end_profile, arc_3d)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/CreateLoftedSolidByProfilesAndPath.png
    :height: 230 px
    :width: 400 px
    :align: center

Тело вращения
^^^^^^^^^^^^^

Вращение плоского замкнутого контура вокруг заданной оси на указанный угол.

.. function:: Revolution(placement, contour, origin, axis, counterClockwiseAngle, ClockwiseAngle)

    :param placement: Задает координатную плоскость.
    :type placement: :ref:`Placement3d <placement3d>`
    :param contour: Задает плоский контур.
    :type contour: :ref:`Curve2d <curve2d>`
    :param origin: Задает точку начала оси вращения.
    :type origin: :ref:`Point3d <point3d>`
    :param axis: Задает ориентацию (вектор) оси вращения.
    :type axis: :ref:`Vector3d <vector3d>`
    :param counterClockwiseAngle: Задает угол вращения против часовой стрелки.
    :type counterClockwiseAngle: Number
    :param ClockwiseAngle: Задает угол вращения по часовой стрелке.
    :type ClockwiseAngle: Number

.. code-block:: lua
    :caption: Пример 12.
    :linenos:

    local placement = renga.Placement3d(renga.Point3d(0, 0, 0),
                                            renga.Vector3d(1, 0, 0),
                                            renga.Vector3d(0, 1, 0))
    local contour = renga.Rectangle(6, 15):fillet_nth(3, 3):fillet_nth(5, 3)
    local solid = renga.Revolution(placement,
                             contour,
                             renga.Point3d(0, 10, 0),
                             renga.Vector3d(0, -0.5, 1),
                             0,
                             270)

    category.geometry.detailed:add_solid(solid:hide_smooth_edges())

Результат:

.. image:: _static/Revolution.png
    :height: 230 px
    :width: 400 px
    :align: center

Методы класса
-------------

Общие методы твердотельной геометрии Solid.

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

* Разместить в относительной системе координат

.. function:: :place(placement)

    :param placement: Задает координатную систему в 3D пространстве.
    :type placement: :ref:`Placement3d <placement3d>`

* Скрытие ребер

.. function:: :hide_smooth_edges()

Операторы
---------

* Булевое сложение

.. function:: +

Пример кода:

.. code-block:: lua
    :caption: Пример 13.
    :linenos:

    local cube = renga.Cube(20)
    local sphere = renga.Sphere(10)

    category.geometry.detailed:add_solid(
        cube + sphere:shift(10, 0, 10):hide_smooth_edges())

Результат:

.. image:: _static/Add_3D.png
    :height: 230 px
    :width: 400 px
    :align: center

* Булевое вычитание

.. function:: -

Пример кода:

.. code-block:: lua
    :caption: Пример 14.
    :linenos:

    local cube = renga.Cube(20)
    local sphere = renga.Sphere(10)

    category.geometry.detailed:add_solid(
        cube - sphere:shift(10, 0, 10):hide_smooth_edges())

Результат:

.. image:: _static/Sub_3D.png
    :height: 230 px
    :width: 400 px
    :align: center
