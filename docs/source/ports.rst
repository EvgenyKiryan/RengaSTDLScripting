Порты
=====

Порты служат для подключения оборудования к трассам инженерных систем. Они являются объектами таблицы ``Style.Ports``.

Чтобы создать порт достаточно объявить его в JSON.

Методы объекта
--------------

* Разместить порт в локальной системе координат

.. note:: По-умолчанию порты создаются в начале координат 

.. function:: :SetPlacement(placement)

    :param placement: Задает ЛСК порта.
    :type placement: :ref:`Placement3D <placement3d>`

.. _port:

.. code-block:: lua
    :caption: Пример 1. Размещение порта ``ColdWater`` объекта в ЛСК ``inletPlacement``:
    :linenos:

    Style.Ports.ColdWater:SetPlacement(inletPlacement)

.. note:: Имена портов берутся из JSON

* Задать у порта якорь на трассе

.. note:: Якорь задается в случае эксцентрического перехода у деталей и аксессуаров трубопроводов и воздуховодов. Благодаря ему трубы и воздуховоды будут прокладываться со смещением от трассы (в случае эксцентрического перехода). Если не задан, он будет соответствовать оси Z порта.

.. function:: :Anchor(axis)

    :param axis: Задает ось.
    :type axis: :ref:`Axis <axis>`

* Задать параметры порту трубопроводных систем

.. function:: :PipeAttributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

.. note:: См. Создание параметра — тип параметра :ref:`Enumeration <enumeration>`

.. code-block:: lua
    :caption: Пример 2. Создание параметров ``connector_type`` и ``nominal_diameter`` порта ``ColdWater`` трубопроводной системы.
    :linenos:

    Style.Ports.ColdWater:PipeAttributes(Style.Parameters.ColdWater.connector_type,
                                         Style.Parameters.ColdWater.nominal_diameter)

* Задать параметры порта трубопроводных систем с резьбовым соединением

.. function:: :PipeThreadedAttributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

* Задать параметры порта вентиляционных систем с воздуховодами круглого сечения

.. function:: :DuctCircularAttributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

* Задать параметры порта вентиляционных систем с воздуховодами прямоугольного сечения

.. function:: :DuctRectangularAttributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

.. code-block:: lua
    :caption: Пример 3. Создание параметров ``connector_type``, ``body_width`` и ``body_height`` порта ``Exhaust`` воздуховодной системы.
    :linenos:

    Style.Ports.Exhaust:DuctRectangularAttributes(Style.Parameters.Exhaust.connector_type,
                                                  Style.Parameters.Dimensions.body_width,
                                                  Style.Parameters.Dimensions.body_height)