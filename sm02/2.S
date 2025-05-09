// Определите (выделите память под) три глобальных 32-битных целых знаковых переменных A, B, R. Напишите функцию process, которая вычисляет R = A*B. Гарантируется, что результат представим 32-битным знаковым числом.

// Умножение следует реализовать на основе сложений и сдвигов, инструкции умножения запрещены. В сдаваемом файле должны быть определены только переменные и функция process.

// Размещайте код в секции .text.

// Размещайте данные в секции .data.

// Не портите значения A и B.


    .intel_syntax noprefix
    .global A, B, R, process

    .data
A: .int -1
B: .int 2147483648
R: .int 42

    .text
inverse: // A >= 0 && B < 0 || A < 0 && B < 0
    xor ebx, ebx
    sub ebx, r12d
    mov r12d, ebx
    
    xor ebx, ebx
    sub ebx, r13d
    mov r13d, ebx

    jmp 1f

process:
    push r12
    push r13
    push r14
    push r15
    push rbx

    mov r12d, [rip + A] // A
    mov r13d, [rip + B] // B

    xor r14d, r14d // R

    cmp r13d, 0
    js inverse
1:
    mov r15d, r12d // Результат текущего умножения

loop:
    // Пока B не равно нулю
    cmp r13d, 0
    je break

    // Смотрим на последний разряд
    mov ebx, r13d
    and ebx, 0x0001

    // Если ноль, значит прибавлять не нужно, но сдвинуть все равно нужно
    je 1f

    // Если единица, прибавляем текущую степень A и двигаем
    add r14d, r15d

1:
    // Двигаем
    shr r13d, 1
    sal r15d, 1
    jmp loop

break:
    mov [rip + R], r14d

    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12

    ret
