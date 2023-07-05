Порты
=====

Порты служат для подключения оборудования к трассам инженерных систем. Они являются объектами таблицы ``Style.Ports``.

Чтобы создать порт достаточно объявить его в JSON.

Методы объекта
--------------

* Разместить порт в локальной системе координат

.. note:: По-умолчанию порты создаются в начале координат 

.. lua:method:: :SetPlacement(placement)

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

.. lua:method:: :SetAnchor(axis)

    :param axis: Задает ось.
    :type axis: :ref:`Axis3D <axis3d>`

* Задать параметры порту трубопроводных систем

.. lua:method:: :SetPipeAttributes(pipeConnectorType, nominalDiameter)

    :param pipeConnectorType: Задает тип соединения.
    :type pipeConnectorType: :ref:`CoreEnum <pipe_type>`
    :param nominalDiameter: Задает номинальный диаметр.
    :type nominalDiameter: Number

.. note:: См. Создание параметра — тип параметра :ref:`CoreEnum <coreenum>`

.. code-block:: lua
    :caption: Пример 2. Создание параметров ``connector_type`` и ``nominal_diameter`` порта ``ColdWater`` трубопроводной системы.
    :linenos:

    Style.Ports.ColdWater:SetPipeAttributes(Style.Parameters.ColdWater.connector_type,
                                            Style.Parameters.ColdWater.nominal_diameter)

* Задать параметры порта трубопроводных систем с резьбовым соединением

.. lua:method:: :SetPipeThreadedAttributes(threadSize)

    :param threadSize: Задает диаметр резьбы.
    :type threadSize: :ref:`CoreEnum <thread_size>`

* Задать параметры порта вентиляционных систем с воздуховодами круглого сечения

.. lua:method:: :SetDuctCircularAttributes(ductConnectorType, diameter)

    :param ductConnectorType: Задает тип соединения.
    :type ductConnectorType: :ref:`CoreEnum <air_type>`
    :param nominalDiameter: Задает диаметр воздуховода.
    :type nominalDiameter: Number

* Задать параметры порта вентиляционных систем с воздуховодами прямоугольного сечения

.. lua:method:: :SetDuctRectangularAttributes(ductConnectorType, width, height)

    :param ductConnectorType: Задает тип соединения.
    :type ductConnectorType: :ref:`CoreEnum <air_type>`
    :param width: Задает ширину воздуховода.
    :type width: Number
    :param height: Задает высоту воздуховода.
    :type width: Number

.. code-block:: lua
    :caption: Пример 3. Создание параметров ``connector_type``, ``body_width`` и ``body_height`` порта ``Exhaust`` воздуховодной системы.
    :linenos:

    Style.Ports.Exhaust:SetDuctRectangularAttributes(Style.Parameters.Exhaust.connector_type,
                                                     Style.Parameters.Dimensions.body_width,
                                                     Style.Parameters.Dimensions.body_height)