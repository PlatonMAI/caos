    .intel_syntax noprefix
    .global main

main:
    call readi64
    mov r12, rax
    xor r13, r13

loop:
    test r12, 1
    je 1f
    inc r13
1:
    cmp r12, 0
    je break
    shr r12, 1
    jmp loop

break:
    mov rdi, r13
    call writei64
    call finish
