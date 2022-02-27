.global main
main:
    mov $0, %ebx
    mov $0, %ecx
loop:
    call readi32
    jc exit

    test $1, %eax
    jz add_odd
    jmp add_even
add_odd:
    add %eax, %ebx
    jmp loop
add_even:
    add %eax, %ecx
    jmp loop
exit:
    mov %ebx, %eax
    call writei32
    mov %ecx, %eax
    call writei32
    call finish
