.global main
  
main:
    call readi64

    add %eax, %eax
    adc %edx, %edx

    mov %edx, %ecx
    mov %eax, %ebx

    call readi64

    shr $1, %eax
    sub %eax, %ebx
    sbb $0, %ecx

    mov %edx, %eax
    shl $31, %eax

    sar $1, %edx


    sub %eax, %ebx
    sbb %edx, %ecx
    mov %ecx, %edx
    mov %ebx, %eax

exit:
    call writei64
    call finish
