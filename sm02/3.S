// Вам дана программа считывающая одно 64 битное число X и печатающая X + delta.

// Напишите последовательность команд GDB такие, что программа запустится, считает и выведет число, но при этом изменив delta на 100500 (до вывода результата).


// break main
// run
// print {int}delta = 100500
// continue


.intel_syntax noprefix
    .global main
main:
    call  readi64
    mov   rdi, rax
    add   rdi, [rip + delta]
    call  writei64
    call  finish
delta:
    .quad 42
