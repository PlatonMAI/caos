    .intel_syntax noprefix
    .global main

even:
    add r13, rax
    jmp loop

main:
    xor r13, r13
    xor r14, r14
loop:
    call readi64
    jc break

    test rax, 1
    
    jne even

    // odd
    add r14, rax
    jmp loop

break:
    mov rdi, r14
    call writei64
    mov rdi, r13
    call writei64
    call finish
