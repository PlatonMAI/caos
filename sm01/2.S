    .intel_syntax noprefix
    .global main
main:
    call readi64
    mov r12, rax

    call readi64
    mov r13, rax

    call readi64
    mov r14, rax

    call readi64
    mov rdi, rax
    call writei64

    // 2B
    sal r13, 1

    // A - 2B
    sub r12, r13

    // 17C
    mov r15, r14
    sal r15, 4
    add r15, r14

    // A - 2b + 17C
    add r12, r15
    
    // Помещаем A в регистр для вывода
    mov rdi, r12

    call writei64
    
    call finish
