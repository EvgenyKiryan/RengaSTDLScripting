Базовые типы геометрии
=======================

Служат для определения более сложных геометрических примитивов (:doc:`двумерных </symbolic>` и :doc:`трёхмерных </geometry>`), а также для размещения в локальной системе координат.

.. _point2d:

Декартова двухмерная точка (класс Point2D)
------------------------------------------

Конструктор класса:

.. function:: Point2D(x, y)

    :param x: Задает координату по оси X.
    :type x: Number
    :param y: Задает координату по оси Y.
    :type y: Number

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. function:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть на угол

.. function:: :Rotate(point, angle)

    :param point: Задает точку центра вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Вернуть копию объекта

.. function:: :Clone()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть значение координаты X точки

.. function:: :GetX()

* Вернуть значение координаты Y точки

.. function:: :GetY()

Операторы
^^^^^^^^^^

* Сравнить на равенство с другой точкой

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

.. _point3d:

Точка в трёхмерном пространстве (класс Point3D)
-----------------------------------------------

Конструктор класса:

.. function:: Point3D(x, y, z)

    :param x: Задает координату по оси X.
    :type x: Number
    :param y: Задает координату по оси Y.
    :type y: Number
    :param z: Задает координату по оси Z.
    :type z: Number

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y, Z

.. function:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть на угол

.. function:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Vector3D <vector3d>`
    :param angle: Задает угол поворота.
    :type angle: Number

* Вернуть копию объекта

.. function:: :Clone()

    :return: Копия точки
    :rtype: :ref:`Point3D <point3d>`  

* Вернуть значение координаты X точки

.. function:: :GetX()

* Вернуть значение координаты Y точки

.. function:: :GetY()

* Вернуть значение координаты Z точки

.. function:: :GetZ()    

Операторы
^^^^^^^^^^

* Сложить точки

.. function:: +

    :return: Трёхмерный вектор
    :rtype: :ref:`Vector3D <vector3d>`  

* Вычесть точки

.. function:: -

    :return: Трёхмерный вектор
    :rtype: :ref:`Vector3D <vector3d>` 

.. _vector3d:

Вектор в трёхмерном пространстве (класс Vector3D)
-------------------------------------------------

Вектор — элемент геометрического пространства, характеризующийся направлением. Направление вектора задаётся набором коэффициентов (соотношение направления) по координатным осям. Как правило, коэффициенты указываются от -1 до 1. Поскольку вектор указывает только направление, соотношение направлений не обязательно нормализовывать.

Конструктор класса:

.. function:: Vector3D(x, y, z)

    :param x: Задает соотношение направления по оси X.
    :type x: Number
    :param y: Задает соотношение направления по оси Y.
    :type y: Number
    :param z: Задает соотношение направления по оси Z.
    :type z: Number

Методы класса
^^^^^^^^^^^^^

* Вернуть соотношение направления по оси X

.. function:: :GetX()

* Вернуть соотношение направления по оси Y

.. function:: :GetY()

* Вернуть соотношение направления по оси Z

.. function:: :GetZ()

Операторы
^^^^^^^^^^

* Унарный минус

.. function:: -

    :return: Вектор, обращенный в обратную сторону
    :rtype: :ref:`Vector3D <vector3d>`  

.. _axis:

Ось (класс Axis)
------------------

Ось — вектор, привязанный к фиксированной точке.

Конструктор класса:

.. function:: Axis(point, vector)

    :param point: Задает точку начала оси.
    :type point: :ref:`Point3D <point3d>`
    :param vector: Задает направление оси.
    :type vector: :ref:`Vector3D <vector3d>`

Альтернативные конструкторы:

.. function:: XAxis()

    :return: Ось X
    :rtype: :ref:`Axis <axis>`

.. function:: YAxis()

    :return: Ось Y
    :rtype: :ref:`Axis <axis>`

.. function:: ZAxis()

    :return: Ось Z
    :rtype: :ref:`Axis <axis>`    

Методы класса
^^^^^^^^^^^^^

* Вернуть вектор оси

.. attention:: Проверить!

.. function:: :GetVector()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть точку начала оси

.. function:: :Origin()

    :rtype: :ref:`Point3D <point3d>`

Операторы
^^^^^^^^^^

* Унарный минус

.. function:: -

    :return: Ось, обращенная в обратную сторону
    :rtype: :ref:`Axis <axis>`  

.. _placement3d:

Локальная система координат в трёхмерном пространстве (класс Placement3D)
-------------------------------------------------------------------------

Конструктор класса:

.. function:: Placement3D(origin, vectorZ, vectorX)

    :param origin: Задает точку начала координат.
    :type origin: :ref:`Point3D <point3d>`
    :param vectorZ: Задает ориентацию оси Z.
    :type vectorZ: :ref:`Vector3D <vector3d>`
    :param vectorX: Задает ориентацию оси X.
    :type vectorX: :ref:`Vector3D <vector3d>`

Методы класса
^^^^^^^^^^^^^

* Сместить ЛСК по осям X, Y, Z

.. function:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть ЛСК относительно заданной оси

.. function:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis <axis>`
    :param angle: Задает угол вращения.
    :type angle: Number

* Трансформировать СК в новую ЛСК

.. function:: :Transform(placement)

    :param placement: Задает новую ЛСК.
    :type placement: :ref:`Placement3D <placement3d>`

* Вернуть копию объекта

.. function:: :Clone()

    :return: Копия ЛСК
    :rtype: :ref:`Placement3D <placement3d>`

* Вернуть начало ЛСК

.. function:: :Origin()

    :return: Начало ЛСК
    :rtype: :ref:`Point3D <point3d>`

* Вернуть ось X

.. function:: :XAxis()

    :rtype: :ref:`Axis <axis>`

* Вернуть ось Y

.. function:: :YAxis()

    :rtype: :ref:`Axis <axis>`

* Вернуть ось Z

.. function:: :ZAxis()

    :rtype: :ref:`Axis <axis>`

* Вернуть вектор оси X

.. function:: :VectorX()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть вектор оси Y

.. function:: :VectorY()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть вектор оси Z

.. function:: :VectorZ()

    :rtype: :ref:`Vector3D <vector3d>`
