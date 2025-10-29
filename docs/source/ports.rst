Порты
=====

Порты служат для подключения оборудования к трассам инженерных систем. Они являются объектами таблицы ``Style``.

Чтобы создать порт достаточно объявить его в JSON.

.. _access_to_ports:

Доступ к портам
---------------

Получить доступ к нужному порту в скриптовой части можно следующими способами:

.. note:: Имена портов берутся из JSON

.. lua:function:: GetPort(portName)

    :param portName: Задает имя порта.
    :type portName: String

Методы порта
------------

Разместить порт в локальной системе координат
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: По умолчанию порты создаются в начале координат 

.. lua:method:: :SetPlacement(placement)

    :param placement: Задает ЛСК порта.
    :type placement: :ref:`Placement3D <placement3d>`

.. _port:

.. code-block:: lua
    :caption: Пример 1. Размещение порта ``ColdWater`` объекта в ЛСК ``inletPlacement``:
    :linenos:

    local inletPlacement = Placement3D(origin, vectorZ, vectorX)
    Style.GetPort("ColdWater"):SetPlacement(inletPlacement)

Задать у порта якорь на трассе
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: Якорь задается в случае эксцентрического перехода у деталей и аксессуаров трубопроводов и воздуховодов. Благодаря ему трубы и воздуховоды будут прокладываться со смещением от трассы. Если не задан, он будет соответствовать оси Z порта.

.. lua:method:: :SetAnchor(axis)

    :param axis: Задает ось.
    :type axis: :ref:`Axis3D <axis3d>`

Задать параметры соединения порту трубопроводных систем
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetPipeParameters(pipeConnectorType, nominalDiameter)

    :param pipeConnectorType: Задает тип соединения.
    :type pipeConnectorType: :ref:`CoreEnum <pipe_type>`
    :param nominalDiameter: Задает номинальный диаметр.
    :type nominalDiameter: Number

.. note:: См. главу :doc:`Создание параметров </createparams>` — тип параметра :ref:`CoreEnum <coreenum>`

.. code-block:: lua
    :caption: Пример 2. Создание параметров ``connectorType`` и ``nominalDiameter`` порта ``ColdWater`` трубопроводной системы.
    :linenos:

    local connectorType = Style.GetParameter("ColdWater", "connectorType"):GetValue()
    local nominalDiameter = Style.GetParameter("ColdWater", "nominalDiameter"):GetValue()
    Style.GetPort("ColdWater"):SetPipeParameters(connectorType, nominalDiameter)

Задать параметры соединения порту трубопроводных систем с резьбовым соединением
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetPipeParameters(pipeConnectorType, threadSize)

    :param pipeConnectorType: Задает тип соединения.
    :type pipeConnectorType: :ref:`CoreEnum <pipe_type>`
    :param threadSize: Задает диаметр резьбы.
    :type threadSize: :ref:`CoreEnum <thread_size>`

Задать параметры соединения порту вентиляционных систем с воздуховодами круглого сечения
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetDuctParameters(ductConnectorType, circularProfile)

    :param ductConnectorType: Задает тип соединения.
    :type ductConnectorType: :ref:`CoreEnum <air_type>`
    :param circularProfile: Задает профиль порта.
    :type circularProfile: :ref:`CircularProfile <circular_profile>`        

Задать параметры соединения порту вентиляционных систем с воздуховодами прямоугольного сечения
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetDuctParameters(ductConnectorType, rectangularProfile)

    :param ductConnectorType: Задает тип соединения.
    :type ductConnectorType: :ref:`CoreEnum <air_type>`
    :param rectangularProfile: Задает профиль порта.
    :type rectangularProfile: :ref:`RectangularProfile <rectangular_profile>`

    Дополнительные параметры для метода SetDuctParameters
    """""""""""""""""""""""""""""""""""""""""""""""""""""

    .. _circular_profile:

    * Круглый профиль
        
    .. lua:function:: CircularProfile(diameter)

        :param diameter: Задает диаметр круглого профиля.
        :type diameter: Number

    .. _rectangular_profile:

    * Прямоугольный профиль
        
    .. lua:function:: RectangularProfile(width, height)

        :param width: Задает ширину прямоугольного профиля.
        :type width: Number
        :param height: Задает высоту прямоугольного профиля.
        :type height: Number

.. code-block:: lua
    :caption: Пример 3. Создание параметров ``connectorType``, ``bodyWidth`` и ``bodyHeight`` порта ``Exhaust`` воздуховодной системы.
    :linenos:

    local connectorType = Style.GetParameter("Exhaust", "connectorType"):GetValue()
    local bodyWidth = Style.GetParameter("Dimensions", "bodyWidth"):GetValue()
    local bodyHeight = Style.GetParameter("Dimensions", "bodyHeight"):GetValue()
    local ductProfile = RectangularProfile(bodyWidth, bodyHeight)

    Style.GetPort("Exhaust"):SetDuctParameters(connectorType, ductProfile)
