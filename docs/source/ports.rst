Порты
=====

Порты служат для подключения оборудования к трассам инженерных систем. Они являются объектами таблицы ``renga.ports``.

Пример создания порта см. :ref:`Создание в Renga точки подключения (порта) объекта <port>`

Методы объекта
--------------

* Разместить порт в локальной системе координат

.. note:: По-умолчанию порты создаются в начале координат 

.. function:: :place(placement)

    :param placement: Задает ЛСК порта.
    :type placement: :ref:`Placement3d <placement3d>`

* Задать у порта якорь на трассе

.. note:: Якорь задается для деталей и аксессуаров трубопроводов и воздуховодов. Если не задан, он будет соответствовать оси Z порта.

.. function:: :anchor(axis)

    :param axis: Задает ось.
    :type axis: :ref:`Axis <axis>`

* Задать параметры порта трубопроводных систем

.. function:: :pipe_attributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

.. note:: См. Создание параметра — тип параметра :ref:`Enumeration <enumeration>`

.. code-block:: lua
    :caption: Пример 1. Создание параметров ``connector_type`` и ``nominal_diameter`` порта ``cold_water`` трубопроводной системы.
    :linenos:

    category.ports.inlet:pipe_attributes(category.parameters.cold_water.connector_type,
                                         category.parameters.cold_water.nominal_diameter)

* Задать параметры порта трубопроводных систем с резьбовым соединением

.. function:: :pipe_threaded_attributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

* Задать параметры порта вентиляционных систем с воздуховодами круглого сечения

.. function:: :duct_circular_attributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

* Задать параметры порта вентиляционных систем с воздуховодами прямоугольного сечения

.. function:: :duct_rectangular_attributes(*args)

    :param args: Перечисление параметров.
    :type args: Имена параметров, указанных в JSON

.. code-block:: lua
    :caption: Пример 2. Создание параметров ``connector_type``, ``body_width`` и ``body_height`` порта ``exhaust`` воздуховодной системы.
    :linenos:

    category.ports.outlet:duct_rectangular_attributes(category.parameters.exhaust.connector_type,
                                                      category.parameters.dimensions.body_width,
                                                      category.parameters.dimensions.body_height)