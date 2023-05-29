Модельная геометрия (класс ModelGeometry)
=========================================

Общий класс **ModelGeometry** не имеет конструктора. ModelGeometry — это произвольный набор геометрических объектов, который может быть ассоциирован с каким-то уровнем детализации стиля.

В зависимости от того, сколько уровней детализации будет использоваться шаблоном стиля, столько экземпляров класса **ModelGeometry** необходимо создать в скрипте.

.. code-block:: lua
    :caption: Пример 1. Создание 3-х экземпляров ``ModelGeometry`` для 3-х различных уровней детализации стиля:
    :linenos:

    local detailedGeometry = ModelGeometry()
    local symbolicGeometry = ModelGeometry()
    local symbolGeometry = ModelGeometry()

Каждый уровень детализации стиля может быть наполнен различными геометрическими примитивами. Для детального уровня детализации это могут быть:

* :doc:`Твёрдотельная 3D-геометрия </geometry>`,
* :doc:`Плоская геометрия </planar>` (для создания вспомогательной геометрии).

Для условного и символьного уровня детализации это может быть :doc:`плоская геометрия </planar>`.

Методы класса
-------------

Добавление твёрдотельной 3D-геометрии
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: :AddSolid(*args)

    :param args: В качестве аргументов передаётся твердотельная 3D-геометрия и её методы.
    :type args: :doc:`Solid <../geometry>`

Добавление плоской геометрии
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. function:: :AddPlanarGeometry(*args)

    :param args: В качестве аргументов передаётся плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

Примеры
-------

.. _cube_example:

Создание детального уровня детализации стиля
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: lua
    :caption: Пример 2. Создание 3D-геометрии в форме куба с размером грани ``size``:
    :linenos:

    local detailedGeometry = ModelGeometry()
    local solid = Cube(size)

    detailedGeometry:AddSolid(solid)
    Style.SetDetailedGeometry(detailedGeometry)

Создание детального уровня детализации стиля со вспомогательной геометрией
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Вспомогательная геометрия — дополнительная плоская геометрия. Обычно используется для создания не существующей в реальном объекте геометрии (направление потока, условное обозначение). Не специфицируется.

.. attention:: Вспомогательная геометрия для детального уровня отображения используется только класса PlanarGeometryGlobalZ().

.. code-block:: lua
    :caption: Пример 3. Создание 3D-геометрии в форме куба и дополнительно вспомогательной геометрии с размещением в ЛСК ``placement``:
    :linenos:

    local detailedGeometry = ModelGeometry()
    local solid = Cube(size)
    local auxGeometry = PlanarGeometryGlobalZ()
    local region = Region({contours})

    auxGeometry:AddHatchBasic(region)
    detailedGeometry:AddSolid(solid)
    detailedGeometry:AddPlanarGeometry(auxGeometry:SetPlacement(placement))
    Style.SetDetailedGeometry(detailedGeometry)

Создание условного уровня детализации стиля
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: lua
    :caption: Пример 4. Создание условного уровня детализации в виде квадрата с размером грани ``size``:
    :linenos:

    local symbolicGeometry = ModelGeometry()
    local planeGeometry = PlanarGeometryPlane()
    local curve2D = Rectangle(size, size)

    planeGeometry:AddCurve(curve2D)
    symbolicGeometry:AddPlanarGeometry(planeGeometry)
    Style.SetSymbolicGeometry(symbolicGeometry)

Создание символьного уровня детализации стиля
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Символьная геометрия, в отличии от условной геометрии, не масштабируется. С помощью символьного уровня детализации создаются условно-графические отображения (УГО) с заданными размерами (указанных в стандартах по выполнению чертежей).

.. code-block:: lua
    :caption: Пример 5. Создание символьного уровня детализации в виде квадрата с размером грани ``size``:
    :linenos:

    local symbolGeometry = ModelGeometry()
    local planeGeometry = PlanarGeometryPlane()
    local curve2D = Rectangle(size, size)

    planeGeometry:AddCurve(curve2D)
    symbolGeometry:AddPlanarGeometry(planeGeometry)
    Style.SetSymbolGeometry(symbolGeometry:SetUnscalable(true))
