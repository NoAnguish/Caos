.global main

main:
    mov $0xdeadbeef, %eax
    mov %eax, %esi
    call writei32
    movzb %esi, %ebx
    movsb %esi, %ecx
    mov %ebx, %eax
    call writei32
    mov %ecx, %eax
    call writei32
    call finish
