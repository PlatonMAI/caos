// Напишите функцию supersum, складывающую беззнаковые "длинные" little-endian числа C = A + B.

// В регистре rax передается адрес первого байта числа A, в rbx - числа B, в rcx - числа С.

// В rsi лежит размер числа A, в rdi размер числа B в байтах.

// Функция должна вернуть в регистре rax 1 + индекс последнего ненулевого байта числа C (иными словами, размер числа C).

// Размер числа 0 - 0.

// Гарантируется, что размер буфера C > max(размер A, размер B).

// Не забывайте сохранять значения регистров, которые нельзя портить.

// Флаги процессора можно сохранять и восстанавливать инструкциями pushf и popf.

// Входные числа могут содержать старшие нулевые байты.


    .intel_syntax noprefix
    .global supersum
supersum:
    push r12
    push r13
    push r14

    // rax = &A, rsi = A.size()
    // rbx = &B, rdi = B.size()
    // rcx = &C, rax = C.size()

    // r8 = min(A, B), r10 = &min(A, B)
    // r9 = max(A, B), r11 = &max(A, B)

    cmp rsi, rdi
    jl 1f
    mov r8, rdi
    mov r10, rbx
    mov r9, rsi
    mov r11, rax
    jmp 2f
1:
    mov r8, rsi
    mov r10, rax
    mov r9, rdi
    mov r11, rbx

2:
    xor r12, r12 // текущий байт
    xor r14b, r14b // остаток
adding_two:
    cmp r12, r8 // Дошли до конца мЕньшего числа?
    je adding_one // Прыгаем, если дошли

    mov r13b, r14b
    xor r14b, r14b
    
    add r13b, [rax + r12] // Прибавляем байт числа A
    jnc 1f
    mov r14b, 1
    
1:
    add r13b, [rbx + r12] // Прибавляем байт числа B
    jnc 1f
    mov r14b, 1

1:
    mov [rcx + r12], r13b // Прибавляем в разряд C получившуюся сумму
    inc r12
    jmp adding_two

adding_one:
    cmp r12, r9
    je adding_carry

    mov r13b, r14b
    xor r14b, r14b
    
    add r13b, [r11 + r12] // Прибавляем байт бОльшего из чисел
    jnc 1f
    mov r14b, 1

1:
    mov [rcx + r12], r13b // Прибавляем в разряд C получившуюся сумму
    inc r12
    jmp adding_one

adding_carry:
    cmp r14b, 0
    je removing_zeros

    mov byte ptr [rcx + r12], 1
    inc r12

removing_zeros:
    cmp r12, 0
    je break

    cmp byte ptr [rcx + r12 - 1], 0
    jne break
    dec r12
    jmp removing_zeros

break:
    mov rax, r12

    pop r14
    pop r13
    pop r12
    ret
