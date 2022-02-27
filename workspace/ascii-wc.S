.global main

read:
    mov $3, %eax
    mov $0, %ebx
    mov $symb, %ecx
    mov $2, %edx

    int $0x80

    cmp $0, %eax
    jz fin
    mov $1, %eax
    mov %eax, is_read
    jmp inc

main:
loop:
    jmp read
inc:
    add $1, symbols
    jmp loop
    
fin:
    cmp $0, is_read
    jz last_fin
    add $1, lines
next_fin:
    cmp $'\n', last_symb
    jz last_fin
    cmp $' ', last_symb
    jz last_fin
    add $1, words
last_fin:
    mov lines, %eax
    call writei32
    mov words, %eax
    call writei32
    mov symbols, %eax
    call writei32
    call finish

.data
words: 
    .int 0
symbols:
    .int 0
lines:
    .int 0
last_symb:
    .ascii " "
symb:
    .ascii " "
is_read:
    .int 0