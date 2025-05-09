    .intel_syntax noprefix
    .global main
    
    .text
main:
    // rax = &A, rsi = A.size()
    // rbx = &B, rdi = B.size()
    // rcx = &C, rax = C.size()

    lea rax, [rip + A]
    lea rbx, [rip + B]
    lea rcx, [rip + C]

    mov rsi, 2
    mov rdi, 4

    call supersum
return:
    ret

    .data
A:
    .byte 5
    .byte 7
B:
    .byte 37
    .byte 192
    .byte 52
    .byte 52

    .bss
C:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
