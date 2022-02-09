# Среднее арифметическое. Расчет приближенного значения квадратного корня.

1. Найти среднее арифметическое для разницы между двумя массивами x и y

    Массивы заданы следующим образом:

    ```nasm
    ​x dd 5, 3, 2, 6, 1, 7, 4
    y dd 0, 10, 1, 9, 2, 8, 5
    ```

2. Написать программу для расчета приближенного значения квадратного корня на языке Assembler

    > Для задания числа использовать память

    Для решения задачи можно использовать два подхода:

      * Использовать формулу приближенного вычисления квадратного корня
	
	    > [*Пример на python в файле sqrt.py*](/sqrt.py)

      * Использовать команды математического сопроцессора (coprocessor)
	
	    > [*Система команд сопроцессора*](https://prog-cpp.ru/asm-coprocessor-command/)