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
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point2d <point2d>`

Методы класса
"""""""""""""

* Вернуть минимум по оси X

.. function:: :x_min()

    :rtype: Number

* Вернуть минимум по оси Y

.. function:: :y_min()

    :rtype: Number

* Вернуть максимум по оси X

.. function:: :x_max()

    :rtype: Number

* Вернуть максимум по оси Y

.. function:: :y_max()

    :rtype: Number

* Вернуть ширину габаритного прямоугольника

.. function:: :width()

    :rtype: Number

* Вернуть высоту габаритного прямоугольника

.. function:: :height()

    :rtype: Number

.. _boundingbox:

Габаритный параллелепипед (класс BoundingBox)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Габаритный параллелепипед - это область 3D-пространства, ограниченная прямым параллелепипедом, грани которого параллельны плоскостям системы координат.

Конструктор класса:

.. function:: BoundingBox(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point3d <point3d>`

Методы класса
"""""""""""""

* Вернуть минимум по оси X

.. function:: :x_min()

    :rtype: Number

* Вернуть минимум по оси Y

.. function:: :y_min()

    :rtype: Number

* Вернуть минимум по оси Z

.. function:: :z_min()

    :rtype: Number

* Вернуть максимум по оси X

.. function:: :x_max()

    :rtype: Number

* Вернуть максимум по оси Y

.. function:: :y_max()

    :rtype: Number

* Вернуть максимум по оси Z

.. function:: :z_max()

    :rtype: Number

* Вернуть центр габаритного куба

.. function:: :center()

    :rtype: :ref:`Point3d <point3d>`

Логические функции
------------------

* Сравнить "=" с метрической точностью

.. function:: is_metric_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить "<" с метрической точностью

.. function:: is_metric_less(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить "<=" с метрической точностью

.. function:: is_metric_less_or_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить ">" с метрической точностью

.. function:: is_metric_greater(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

* Сравнить ">=" с метрической точностью

.. function:: is_metric_greater_or_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: Number
    :param num2: Задает переменную для сравнения.
    :type num2: Number
    :rtype: boolean

Сервисные функции
-----------------

* Вывод аргументов в журнал AecApp.log

.. function:: print(*args)

    :param args: Задает функцию или переменную, сконвертированную в строку.
    :type args: String