Назначение параметров
=====================

После импорта шаблона категории в Renga, все параметры, описанные в ``parameters.json``, будут являться объектами таблицы ``category.parameters`` и храниться в группе, к которой они принадлежат. Получить доступ к нужному параметру в скриптовой части можно следующими способами:

.. code-block:: lua
    :caption: Пример 1. Присвоение локальной переменной ``width`` значения параметра ``body_width`` из группы параметров ``dimensions``
    :linenos:
    
    local width = category.parameters["dimensions"].body_width

Эта запись эквивалентна:

.. code-block:: lua
    :caption: Пример 2.
    :linenos:
    
    local width = category.parameters.dimensions.body_width

Через глобальное окружение:

.. code-block:: lua
    :caption: Пример 3. Присвоение локальной переменной ``width`` значения параметра ``body_width`` из группы параметров ``dimensions`` из глобального окружения
    :linenos:
    
    local width = _G["category"].parameters.dimensions.body_width

Подробнее см. `Accessing Global Variables with Dynamic Names <https://www.lua.org/pil/14.1.html>`_