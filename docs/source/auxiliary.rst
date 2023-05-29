Вспомогательные функции
=======================

Вспомогательная геометрия
-------------------------

.. _boundingrect:

Габаритный прямоугольник (класс BoundingRect)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Конструктор класса:

.. function:: BoundingRect(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point2D <point2d>`

Методы класса
"""""""""""""

* Вернуть минимум по оси X

.. function:: :XMin()

    :rtype: Number

* Вернуть минимум по оси Y

.. function:: :YMin()

    :rtype: Number

* Вернуть максимум по оси X

.. function:: :XMax()

    :rtype: Number

* Вернуть максимум по оси Y

.. function:: :YMax()

    :rtype: Number

* Вернуть ширину габаритного прямоугольника

.. function:: :Width()

    :rtype: Number

* Вернуть высоту габаритного прямоугольника

.. function:: :Height()

    :rtype: Number

.. _boundingbox:

Габаритный параллелепипед (класс BoundingBox)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Габаритный параллелепипед - это область 3D-пространства, ограниченная прямым параллелепипедом, грани которого параллельны плоскостям системы координат.

Конструктор класса:

.. function:: BoundingBox(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point3D <point3d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point3D <point3d>`

Методы класса
"""""""""""""

* Вернуть минимум по оси X

.. function:: :XMin()

    :rtype: Number

* Вернуть минимум по оси Y

.. function:: :YMin()

    :rtype: Number

* Вернуть минимум по оси Z

.. function:: :ZMin()

    :rtype: Number

* Вернуть максимум по оси X

.. function:: :XMax()

    :rtype: Number

* Вернуть максимум по оси Y

.. function:: :YMax()

    :rtype: Number

* Вернуть максимум по оси Z

.. function:: :ZMax()

    :rtype: Number

* Вернуть центр габаритного куба

.. function:: :Center()

    :rtype: :ref:`Point3D <point3d>`

Логические функции
------------------

* Сравнить "=" с метрической точностью

.. function:: IsMetricEqual(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить "<" с метрической точностью

.. function:: IsMetricLess(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить "<=" с метрической точностью

.. function:: IsMetricLessOrEqual(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить ">" с метрической точностью

.. function:: IsMetricGreater(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить ">=" с метрической точностью

.. function:: IsMetricGreaterOrEqual(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

Сервисные функции
-----------------

* Вывод аргументов в журнал AecApp.log

.. function:: Print(*args)

    :param args: Задает функцию или переменную, сконвертированную в строку.
    :type args: String