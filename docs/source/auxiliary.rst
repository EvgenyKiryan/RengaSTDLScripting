Вспомогательные функции
=======================

Вспомогательная геометрия
-------------------------

.. _boundingrect:

Габаритный прямоугольник (класс BoundingRect)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Конструктор класса:

.. lua:function:: BoundingRect(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point2D <point2d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point2D <point2d>`

Методы класса
"""""""""""""

* Вернуть минимум по оси X

.. lua:method:: :GetMinX()

    :rtype: Number

* Вернуть минимум по оси Y

.. lua:method:: :GetMinY()

    :rtype: Number

* Вернуть максимум по оси X

.. lua:method:: :GetMaxX()

    :rtype: Number

* Вернуть максимум по оси Y

.. lua:method:: :GetMaxY()

    :rtype: Number

* Вернуть ширину габаритного прямоугольника

.. lua:method:: :GetWidth()

    :rtype: Number

* Вернуть высоту габаритного прямоугольника

.. lua:method:: :GetHeight()

    :rtype: Number

* Вернуть центр габаритного прямоугольника

.. lua:method:: :GetCenter()

    :rtype: :ref:`Point2D <point2d>`


Сервисные функции
-----------------

* Вывод аргументов в журнал AecApp.log

.. lua:function:: print(*args)

    :param args: Задает функцию или переменную, сконвертированную в строку.
    :type args: String

.. note:: Подробнее про использование функции print() см. главу `Тестирование и отладка <https://help.rengabim.com/stdl/ru/testing_and_debugging.html>`_ справочного руководства Renga STDL