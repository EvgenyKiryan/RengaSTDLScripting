Базовые типы геометрии
=======================

Служат для определения более сложных геометрических примитивов (:doc:`двумерных </symbolic>` и :doc:`трёхмерных </geometry>`), а также для размещения в локальной системе координат.

.. _point2d:

Декартова двухмерная точка (класс Point2D)
------------------------------------------

Конструктор класса:

.. lua:function:: Point2D(x, y)

    :param x: Задает координату по оси X.
    :type x: Number
    :param y: Задает координату по оси Y.
    :type y: Number

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть на угол

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку центра вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point2D <point2d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в двумерном пространстве.
    :type matrix: :ref:`Matrix2D <matrix2d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Двухмерная точка
    :rtype: :ref:`Point2D <point2d>`

* Вернуть значение координаты X точки

.. lua:method:: :GetX()

* Вернуть значение координаты Y точки

.. lua:method:: :GetY()

Операторы
^^^^^^^^^^

* Проверить равенство с другой точкой

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой точкой

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

.. _point3d:

Точка в трёхмерном пространстве (класс Point3D)
-----------------------------------------------

Конструктор класса:

.. lua:function:: Point3D(x, y, z)

    :param x: Задает координату по оси X.
    :type x: Number
    :param y: Задает координату по оси Y.
    :type y: Number
    :param z: Задает координату по оси Z.
    :type z: Number

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y, Z

.. lua:method:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть на угол

.. lua:method:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis3D <axis3d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale, zScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point3D <point3d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Z.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в трёхмерном пространстве.
    :type matrix: :ref:`Matrix3D <matrix3d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия точки
    :rtype: :ref:`Point3D <point3d>`  

* Вернуть значение координаты X точки

.. lua:method:: :GetX()

* Вернуть значение координаты Y точки

.. lua:method:: :GetY()

* Вернуть значение координаты Z точки

.. lua:method:: :GetZ()    

Операторы
^^^^^^^^^^

* Проверить равенство с другой точкой

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой точкой

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

.. _vector3d:

Вектор в трёхмерном пространстве (класс Vector3D)
-------------------------------------------------

Вектор — элемент геометрического пространства, характеризующийся направлением. Направление вектора задаётся набором коэффициентов (соотношение направления) по координатным осям. Как правило, коэффициенты указываются от -1 до 1. Поскольку вектор указывает только направление, соотношение направлений не обязательно нормализовывать.

Конструктор класса:

.. lua:function:: Vector3D(x, y, z)

    :param x: Задает соотношение направления по оси X.
    :type x: Number
    :param y: Задает соотношение направления по оси Y.
    :type y: Number
    :param z: Задает соотношение направления по оси Z.
    :type z: Number

Методы класса
^^^^^^^^^^^^^

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия точки
    :rtype: :ref:`Vector3D <vector3d>` 

* Вернуть соотношение направления по оси X

.. lua:method:: :GetX()

* Вернуть соотношение направления по оси Y

.. lua:method:: :GetY()

* Вернуть соотношение направления по оси Z

.. lua:method:: :GetZ()

* Изменить направление на противоположное

.. lua:method:: :Negate()

    :return: Вектор, обращенный в обратную сторону
    :rtype: :ref:`Vector3D <vector3d>` 

Операторы
^^^^^^^^^^

* Проверить равенство с другим вектором

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другим вектором

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean 

.. _axis3d:

Ось (класс Axis3D)
------------------

Ось — вектор, привязанный к фиксированной точке.

Конструктор класса:

.. lua:function:: Axis3D(point, vector)

    :param point: Задает точку начала оси.
    :type point: :ref:`Point3D <point3d>`
    :param vector: Задает направление оси.
    :type vector: :ref:`Vector3D <vector3d>`

Альтернативные конструкторы:

.. lua:function:: CreateXAxis3D()

    :return: Ось X
    :rtype: :ref:`Axis3D <axis3d>`

.. lua:function:: CreateYAxis3D()

    :return: Ось Y
    :rtype: :ref:`Axis3D <axis3d>`

.. lua:function:: CreateZAxis3D()

    :return: Ось Z
    :rtype: :ref:`Axis3D <axis3d>`    

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y, Z

.. lua:method:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть на угол

.. lua:method:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis3D <axis3d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale,zScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point3D <point3d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Z.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в трёхмерном пространстве.
    :type matrix: :ref:`Matrix3D <matrix3d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия оси
    :rtype: :ref:`Axis3D <axis3d>`

* Вернуть вектор направления оси

.. lua:method:: :GetDirection()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть точку начала оси

.. lua:method:: :GetOrigin()

    :rtype: :ref:`Point3D <point3d>`

* Вернуть противоположно направленную ось

.. lua:method:: :Negate()

    :return: Ось, обращенная в обратную сторону
    :rtype: :ref:`Axis3D <axis3d>` 

Операторы
^^^^^^^^^^

* Проверить равенство с другой осью

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой осью

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean 

.. _placement3d:

Локальная система координат в трёхмерном пространстве (класс Placement3D)
-------------------------------------------------------------------------

Конструктор класса:

.. lua:function:: Placement3D(origin, vectorZ, vectorX)

    :param origin: Задает точку начала координат.
    :type origin: :ref:`Point3D <point3d>`
    :param vectorZ: Задает направление оси Z.
    :type vectorZ: :ref:`Vector3D <vector3d>`
    :param vectorX: Задает направление оси X.
    :type vectorX: :ref:`Vector3D <vector3d>`

Методы класса
^^^^^^^^^^^^^

* Сместить ЛСК по осям X, Y, Z

.. lua:method:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dZ: Задает смещение по оси Z.
    :type dZ: Number

* Повернуть ЛСК относительно заданной оси

.. lua:method:: :Rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis3D <axis3d>`
    :param angle: Задает угол вращения.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale,zScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point3D <point3d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Z.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в трёхмерном пространстве.
    :type matrix: :ref:`Matrix3D <matrix3d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Копия ЛСК
    :rtype: :ref:`Placement3D <placement3d>`

* Вернуть начало ЛСК

.. lua:method:: :GetOrigin()

    :return: Начало ЛСК
    :rtype: :ref:`Point3D <point3d>`

* Вернуть ось X

.. lua:method:: :GetXAxis()

    :rtype: :ref:`Axis3D <axis3d>`

* Вернуть ось Y

.. lua:method:: :GetYAxis()

    :rtype: :ref:`Axis3D <axis3d>`

* Вернуть ось Z

.. lua:method:: :GetZAxis()

    :rtype: :ref:`Axis3D <axis3d>`

* Вернуть направление оси X

.. lua:method:: :GetXAxisDirection()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть направление оси Y

.. lua:method:: :GetYAxisDirection()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть направление оси Z

.. lua:method:: :GetZAxisDirection()

    :rtype: :ref:`Vector3D <vector3d>`

* Вернуть матрицу преобразования из ЛСК

.. lua:method:: :GetMatrix()

    :rtype: :ref:`Matrix3D <matrix3d>`

Операторы
^^^^^^^^^

* Проверить равенство с другой ЛСК

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой ЛСК

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

.. _matrix2d:

Матрица преобразования в двумерном пространстве (класс Matrix2D)
----------------------------------------------------------------

Конструктор класса:

.. lua:function:: Matrix2D()

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть на угол

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку центра вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point2D <point2d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в двумерном пространстве.
    :type matrix: :ref:`Matrix2D <matrix2d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Матрица преобразования в двумерном пространстве
    :rtype: :ref:`Matrix2D <matrix2d>`

* Инвертировать матрицу

.. lua:method:: :Invert()

Операторы
^^^^^^^^^^

* Проверить равенство с другой матрицей

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой матрицей

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean

.. _matrix3d:

Матрица преобразования в трёхмерном пространстве (класс Matrix3D)
-----------------------------------------------------------------

Конструктор класса:

.. lua:function:: Matrix3D()

Методы класса
^^^^^^^^^^^^^

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY, dZ)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number
    :param dY: Задает смещение по оси Z.
    :type dY: Number

* Повернуть на угол

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку центра вращения.
    :type point: :ref:`Point3D <point3d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать относительно точки

.. lua:method:: :Scale(point, xScale, yScale)

    :param point: Задает точку центра масштабирования.
    :type point: :ref:`Point3D <point3d>`
    :param xScale: Задает коэффициент масштабирования по оси X.
    :type xScale: Number
    :param yScale: Задает коэффициент масштабирования по оси Y.
    :type yScale: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в трёхмерном пространстве.
    :type matrix: :ref:`Matrix3D <matrix3d>`

* Вернуть копию объекта

.. lua:method:: :Clone()

    :return: Матрица преобразования в трёхмерном пространстве
    :rtype: :ref:`Matrix3D <matrix3d>`

* Инвертировать матрицу

.. lua:method:: :Invert()

Операторы
^^^^^^^^^^

* Проверить равенство с другой матрицей

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

* Проверить неравенство с другой матрицей

.. function:: ~=

    :return: Логическое значение
    :rtype: Boolean