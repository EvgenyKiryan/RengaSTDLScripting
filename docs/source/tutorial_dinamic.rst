Динамическая часть
==================

Динамическая часть описания шаблонной категории — создание скрипта на языке Lua, создающий на основе параметров из ``parameters.json`` категорию объекта Renga.

Скриптование в "коротком стиле"
-------------------------------

.. attention:: Не обязательная часть.

В разделе :doc:`Lua-интерфейс Renga </packages>` приведен :ref:`пример #4 <cube_example>` создания твердотельной 3D-геометрии в виде куба. Если вместо переменной ``size`` нам нужно взять значение параметра, который будет описан в группе ``dimensions`` файла ``parameters.json``, то полный код примера будет таким:

.. code-block:: lua
    :caption: Скрипт создания куба в полном варианте

    local solid = renga.Cube(category.parameters.dimensions.size)

.. important:: Если вам нравится писать код в таком стиле, то можно сразу переходить к следующей части.

Воспользуемся особенностью языка Lua и переведем содержимое таблиц ``renga`` и ``category.parameters`` в глобальное окружение, чтобы код из :ref:`примера #4 <cube_example>` мог быть написан следующим образом:

.. code-block:: lua
    :caption: Скрипт создания куба в "коротком стиле"

    local solid = Cube(dimensions.size)

Этот скрипт добавит удобства по работе со встроенными функциями и сократит код.

.. code-block:: lua
    :caption: Перевод объектов таблиц ``renga`` и ``category.parameters`` в глобальное окружение
    :linenos:

    local env = {}
    local function merge_tables(src, dst)
        for k, v in pairs(src) do dst[k] = v end
    end

    merge_tables(renga, env)
    merge_tables(category.parameters, env)
    setmetatable(env, {__index=_ENV, __newindex=_ENV})
    _ENV=env

В данном примере создается пустая таблица нового окружения ``env`` и функция ``merge_tables``, которая записывает в таблицу ``env`` содержимое передаваемых ей в качестве аргумента ``src`` таблиц ``renga`` и ``category.parameters``. Затем новое окружение устанавливается в глобальное.

.. note:: Дальнейшие примеры скриптов будут приводится в "коротком стиле". 

Создание детальной 3D-геометрии
-------------------------------

Корпус настенного блока VRF-системы будет создан телом выдавливания :ref:`Extrusion <extrusion>`.

Создадим функцию ``make_profile()``, которая будет создавать пятиугольник по точкам - замкнутый контур :ref:`ClosedContourByPoints <closed_contour>`. Координаты точек будут определяться параметрами ``body_height`` и ``body_weight``:

.. code-block:: lua
    :caption: Функция ``make_profile()``, создающая профиль корпуса оборудования.
    :linenos:

    local function make_profile()
        local points = {
            Point2d(0, 0),
            Point2d(0, dimensions.body_height),
            Point2d(dimensions.body_width, dimensions.body_height),
            Point2d(dimensions.body_width, dimensions.body_height / 8),
            Point2d(dimensions.body_width / 3, 0)}
        return ClosedContourByPoints(points)
            :fillet_nth(2, dimensions.body_width / 4)
    end

Метод ``fillet`` скругляет вершину контура с индексом [2] по радиусу, равным ``body_width`` / 4.

.. attention:: Добавить картинку

Далее создадим тело выдавливания :ref:`Extrusion <extrusion>` на длину ``body_length``, разместим его в своей локальной системе координат ``placement`` с помощью метода ``place`` и создадим детальную геометрию категории ``category.geometry.detailed`` с помощью метода ``add_solid``.

.. code-block:: lua
    :caption: Создание детальной геометрии категории.
    :linenos:

    local placement = Placement3d(
        Point3d(0, 0, 0),
        Vector3d(-1, 0, 0),
        Vector3d(0, -1, 0))

    local solid = Extrusion(make_profile(), dimensions.body_length)
        :place(placement)
        :shift(dimensions.body_length / 2, -dimensions.body_width / 2, 0)

    category.geometry.detailed:add_solid(solid)

.. note:: Центр геометрического примитива создается в начале координат своей ЛСК.
    
    Выдавливание профиля выполняется относительно локальной оси Z, т.е. вертикально. С помощью метода ``place`` мы задаем новую ЛСК, в которой тело ориентируется горизонально (поворачиваем оси).

Создание условной геометрии
---------------------------

.. attention:: Этот блок дописывается

Создание портов
---------------

Создание портов трубопроводных систем
"""""""""""""""""""""""""""""""""""""

Объявим несколько локальных переменных, которые помогут создать декартовы точки  портов.

.. code-block:: lua
    :caption: Создание локальных переменных.
    :linenos:

    local half_width = dimensions.body_width / 2
    local half_length_with_indent50 = dimensions.body_length / 2 - 50

    local water_coolant_origin = Point3d(0, 0, 0)
    local gas_coolant_origin = Point3d(0, 0, 0)
    local drainage_origin = Point3d(0, 0, 0)

Следующая часть кода размещает декартовы точки портов в зависимости от параметра ``connection_side``: слева или справа относительно центра корпуса оборудования. Координату X определяет переменная ``half_length_with_indent50``, координата Y высчитывается с учетом параметра отступа ``port_indentation``, а координаты Z — фиксированы (25, 50 и 75).

.. code-block:: lua
    :caption: Размещение декартовых точек портов с учетом параметра ``connection_side``.
    :linenos:

    if water_coolant.connection_side == "right" then
        water_coolant_origin = Point3d(half_length_with_indent50,
                                       -half_width - water_coolant.port_indentation, 75)
    else
        water_coolant_origin = Point3d(-half_length_with_indent50,
                                       -half_width - water_coolant.port_indentation, 75)
    end

    if gas_coolant.connection_side == "right" then
        gas_coolant_origin = Point3d(half_length_with_indent50,
                                     -half_width - gas_coolant.port_indentation, 50)
    else
        gas_coolant_origin = Point3d(-half_length_with_indent50,
                                     -half_width - gas_coolant.port_indentation, 50)
    end

    if drainage.connection_side == "right" then
        drainage_origin = Point3d(half_length_with_indent50,
                                  -half_width - drainage.port_indentation, 25)
    else
        drainage_origin = Point3d(-half_length_with_indent50,
                                  -half_width - drainage.port_indentation, 25)
    end

.. attention:: Добавить картинку

Создадим функцию ``rotate_vectors``, которая будет возвращать векторы осей Z и X в зависимости от параметра ``connection_direction``, задающего направление подключения.

.. code-block:: lua
    :caption: Функция ``rotate_vectors``.
    :linenos:

    local function rotate_vectors(name)
        local vector_z = Vector3d(0, 0, 1)
        local vector_x = Vector3d(1, 0, 0)

        if category.parameters[name].connection_direction == "side" then
            if category.parameters[name].connection_side == "right" then
                vector_z = Vector3d(1, 0, 0)
                vector_x = Vector3d(0, 1, 0)
            else
                vector_z = Vector3d(-1, 0, 0)
                vector_x = Vector3d(0, 1, 0)
            end
        elseif category.parameters[name].connection_direction == "back" then
            vector_z = Vector3d(0, 1, 0)
            vector_x = Vector3d(1, 0, 0)
        else
            vector_z = Vector3d(0, 0, -1)
            vector_x = Vector3d(1, 0, 0)
        end
        local vectors = {z = vector_z, x = vector_x}
        return vectors
    end

Создадим функцию, которая будет добавлять параметры портам и в зависимости от вида соединения будет вызывать метод ``pipe_attributes`` или ``pipe_threaded_attributes`` (см. раздел :doc:`Порты </ports>`)

.. code-block:: lua
    :caption: Функция ``set_pipe_attributes``.
    :linenos:

    local function set_pipe_attributes(port, params)
        return params.connector_type == pipe_connector_type.thread
            and port:pipe_threaded_attributes(params.thread_size)
            or port:pipe_attributes(params.connector_type, params.nominal_diameter)
    end

Добавим порты в категорию ``category.ports.*`` с помощью метода ``place``. И далее добавим параметры портам с помощью созданной функции ``set_pipe_attributes``.

.. code-block:: lua
    :caption: Добавление портов ``water_coolant``, ``gas_coolant`` и ``drainage`` со своими параметрами.
    :linenos:

    category.ports.water_coolant:place(Placement3d(water_coolant_origin,
                                                   rotate_vectors("water_coolant").z,
                                                   rotate_vectors("water_coolant").x))
    set_pipe_attributes(category.ports.water_coolant, water_coolant)

    category.ports.gas_coolant:place(Placement3d(gas_coolant_origin,
                                                 rotate_vectors("gas_coolant").z,
                                                 rotate_vectors("gas_coolant").x))
    set_pipe_attributes(category.ports.gas_coolant, gas_coolant)

    category.ports.drainage:place(Placement3d(drainage_origin,
                                              rotate_vectors("drainage").z,
                                              rotate_vectors("drainage").x))
    set_pipe_attributes(category.ports.drainage, drainage)

Создание портов электрических систем
""""""""""""""""""""""""""""""""""""

.. attention:: Этот блок дописывается

Настройка отображения параметров в диалоге стиля объекта
--------------------------------------------------------

Создадим функцию, которая в зависимости от выбранного вида соединения будет отображать в диалоге стиля объекта либо параметр ``nominal_diameter``, либо ``tread_size``. В теле функции мы вызываем метод ``set_param_visible`` таблицы ``category.ui``. Вызовем эту функцию для групп параметров ``water_coolant``, ``gas_coolant`` и ``drainage``.

.. code-block:: lua
    :caption: Функция ``show_pipe_port_params``.
    :linenos:

    local function show_pipe_port_params(name)
        local param = category.parameters[name].connector_type == pipe_connector_type.thread
            and "nominal_diameter" or "thread_size"
        category.ui:set_param_visible(string.format("%s.%s", name, param), false)
    end

    show_pipe_port_params("water_coolant")
    show_pipe_port_params("gas_coolant")
    show_pipe_port_params("drainage")

.. note:: Если у группы скрыть все параметры, то она также автоматически будет скрыта.

И наши параметры в диалоге стиля объекта будут отображаться теперь так:

.. attention:: Добавить картинку