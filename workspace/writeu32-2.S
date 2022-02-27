.global main

main:
    call readi32
    mov %eax, %ecx
    call writeu32
    call finish

writeu32:
    push %ebp
    mov %esp, %ebp
    mov $4, %eax
    mov $1, %ebx
    push %ecx
    sub $1, %esp
    mov %esp, %ecx 
    mov $1, %edx
    int $0x80
    pop %ecx
    mov %ebp, %esp
    pop %ebp
    ret
