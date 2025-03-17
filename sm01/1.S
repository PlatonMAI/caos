    .intel_syntax noprefix
    .global main
main:
    mov edi, 42
    call writei32
    call finish
