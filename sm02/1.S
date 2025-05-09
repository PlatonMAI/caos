// На стандартном потоке ввода программе подаются целые знаковые 32-битные числа. Признаком завершения ввода является флаг CF=1 после вызова функции readi32.

// После окончания ввода напечатайте числа в обратном порядке.

// Не используйте глобальные переменные (обычно объявляемые в секции `.data` или `.bss`).

// Гарантируется, что список поместится на стек.


    .intel_syntax noprefix
    .global main

main:
    mov r12, rsp
loop_read:
    call readi32
    jc loop_write
    push rax
    jmp loop_read

loop_write:
    cmp r12, rsp
    je break
    pop rdi
    call writei32
    jmp loop_write

break:
    call finish
