Lua-интерфейс Renga
===================

Скрипты, описывающие геометрическое представление категории, расположение портов и поведение параметров из ``parameters.json``, создаются в файле ``main.lua``.

Описанию встроенных функций, создающих пользовательскую категорию в Renga, посвященна данная часть руководства.

.. note:: Кроме использования встроенных функций, разработчики могут использовать в скриптах любые стандартные библиотеки Lua, например, математическую библиотеку `math <http://lua-users.org/wiki/MathLibraryTutorial>`_.

Создание геометрического примитива c помощью встроенных функций
---------------------------------------------------------------

Геометрическое представление объектов инженерных систем создается из геометрических примитивов: двумерных и трёхмерных. Функции, порождающие геометрические примитивы, а также :doc:`системные перечисления </coreenums>` являются объектами таблицы ``renga``.

Подробному описанию порождающих функций посвящены отдельные разделы руководства:

1. :doc:`Базовые типы геометрии </basetypes>`.
2. :doc:`Графические примитивы </symbolic>`.
3. :doc:`Плоская геометрия </planar>`.
4. :doc:`Твёрдотельная 3D-геометрия </geometry>`.
5. :doc:`Вспомогательные функции </auxiliary>`.

Общие примеры:

.. code-block:: lua
    :caption: Пример 1. Создание твердотельной 3D-геометрии в виде сферы, радиусом ``radius``:
    :linenos:

    local solid = renga.Sphere(radius)

.. code-block:: lua
    :caption: Пример 2. Создание плоской геометрии PlanarGeometryAxis90():
    :linenos:

    local planar_geometry = renga.PlanarGeometryAxis90()

.. code-block:: lua
    :caption: Пример 3. Создание точки в трёхмерном пространстве:
    :linenos:

    local point_3d = renga.Point3d(x, y, z)

Создание категории
------------------

Для создания категории используется интерфейс ``category``, содержащий объекты и функции:

``category.geometry`` — таблица объектов, создающих геометрию категории для различного отображения:

+ ``category.geometry.detailed`` — создание детальной геометрии и :ref:`вспомогательной плоской геометрии <aux>` в 3D;    
+ ``category.geometry.symbolic`` — создание условного изображения (плоской геометрии) на различных проекциях;
+ ``category.geometry.symbol`` — создание символьного изображения (плоской геометрии) на различных проекциях.

``category.ports`` — таблица объектов, создающих порты оборудования.

``category.ui`` — отображение параметров в диалоге стиля объекта (на вкладке "Параметры").

``category.parameters`` — таблица групп параметров.

.. _cube_example:

Создание детальной геометрии категории
""""""""""""""""""""""""""""""""""""""

Объект:  ``category.geometry.detailed``

Метод:

.. function:: :add_solid(*args)

    :param args: В качестве аргументов передаётся твердотельная 3D-геометрия и её методы.
    :type args: :doc:`Solid <../geometry>`

.. code-block:: lua
    :caption: Пример 4. Создание 3D-геометрии в форме куба с размером грани ``size``:
    :linenos:

    local solid = renga.Cube(size)

    category.geometry.detailed:add_solid(solid)

Создание вспомогательной геометрии категории
""""""""""""""""""""""""""""""""""""""""""""

Объект:  ``category.geometry.detailed``

.. _aux:

.. note:: Вспомогательная геометрия — дополнительная плоская геометрия. Обычно используется для создания не существующей в реальном объекте геометрии (направление потока, условное обозначение). Не специфицируется.

Метод:

.. function:: :add_planar_geometry(*args)

    :param args: В качестве аргументов передаётся плоская геометрия PlanarGeometryGlobalZ() и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример 5. Создание 3D-геометрии в форме куба и дополнительно вспомогательной геометрии с размещением в ЛСК ``placement``:
    :linenos:

    local solid = renga.Cube(size)
    local aux_geometry = renga.PlanarGeometryGlobalZ()

    aux_geometry:add_hatch_basic(region)
    category.geometry.detailed:add_solid(solid)
    category.geometry.detailed:add_planar_geometry(aux_geometry:set_placement(placement))

Создание условного изображения категории
""""""""""""""""""""""""""""""""""""""""

Объект:  ``category.geometry.symbolic``

Метод:

.. function:: :add_planar_geometry(*args)

    :param args: В качестве аргументов передаётся плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример 6. Создание условного отображения в виде квадрата с размером грани ``size``:
    :linenos:

    local plane_geometry = renga.PlanarGeometryPlane()
    local curve_2d = renga.Rectangle(size, size)

    plane_geometry:add_curve(curve_2d)   
    category.geometry.symbolic:add_planar_geometry(plane_geometry)

Создание символьного изображение категории
""""""""""""""""""""""""""""""""""""""""""

Объект:  ``category.geometry.symbol``

Метод:

.. function:: :add_planar_geometry(*args)

    :param args: В качестве аргументов передается плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример 7. Создание символьного отображения в виде квадрата с размером грани ``size``:
    :linenos:

    local plane_geometry = renga.PlanarGeometryPlane()
    local curve_2d = renga.Rectangle(size, size)

    plane_geometry:add_curve(curve_2d)
    category.geometry.symbol:add_planar_geometry(plane_geometry:set_unscalable(true))

.. _port:

Создание точки подключения (порта) категории
""""""""""""""""""""""""""""""""""""""""""""

Таблица:  ``category.ports``

.. code-block:: lua
    :caption: Пример 8. Создание порта объекта с входящим направлением потока ``inlet`` c заданием собственной ЛСК ``inlet_placement``:
    :linenos:

    category.ports.inlet:place(inlet_placement)

.. note:: Имена портов берутся из JSON

Задание видимости параметра в диалоге стиля объекта
"""""""""""""""""""""""""""""""""""""""""""""""""""

Объект:  ``category.ui``

Метод:

.. function:: :set_param_visible(parameter, bool)

    :param parameter: Задает идентификатор (имя) :doc:`параметра <../createparams>`.
    :type parameter: String
    :param bool: Задает видимость параметра. True - видимый, False - невидимый
    :type bool: Boolean

.. note:: Имена параметров берутся из JSON

.. code-block:: lua
    :caption: Пример 9. Создание видимости параметра ``body_width`` группы параметров ``dimensions`` во вкладке "Параметры" окна стиля объекта:
    :linenos:

    category.ui:set_param_visible("dimensions.body_width", true)

Задание видимости группы параметров в диалоге стиля объекта
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Объект:  ``category.ui``

Метод:

.. function:: :set_group_visible(group, bool)

    :param group: Задает идентификатор (имя) :doc:`группы параметров <../createparams>`.
    :type group: String
    :param bool: Задает видимость группы параметров. True - видимый, False - невидимый
    :type bool: Boolean

.. note:: Имена групп параметров берутся из JSON

.. code-block:: lua
    :caption: Пример 10. Создание видимости группы параметров ``electric_actuator_dimensions`` во вкладке "Параметры" окна стиля объекта:
    :linenos:

    category.ui:set_group_visible("electric_actuator_dimensions", true)