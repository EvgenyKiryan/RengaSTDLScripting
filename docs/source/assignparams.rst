Назначение параметров
=====================

После импорта шаблона категории в Renga, все параметры, описанные в ``parameters.json``, будут являться объектами таблицы ``Style.Parameters`` и храниться в группе, к которой они принадлежат. Получить доступ к нужному параметру в скриптовой части можно следующими способами:

.. code-block:: lua
    :caption: Пример 1. Присвоение локальной переменной ``width`` значения параметра ``body_width`` из группы параметров ``Dimensions``
    :linenos:
    
    local width = Style.Parameters["Dimensions"].body_width

Эта запись эквивалентна:

.. code-block:: lua
    :caption: Пример 2.
    :linenos:
    
    local width = Style.Parameters.Dimensions.body_width
