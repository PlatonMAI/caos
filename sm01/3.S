    .intel_syntax noprefix
    .global main

print:
    mov edi, r12d
    call writei32
    jmp loop

main:
    call readi32
    mov r12d, eax
    add r12d, 1
loop:
    sub r12d, 1
    jns print
    call finish
