.global main
  
main:
   mov $0, %ebx
loop:
    call readi32
    jc exit_with_eof
    add %eax, %ebx
    jo exit_with_overflow
    call loop
exit_with_eof:
    mov %ebx, %eax
    jmp exit
exit_with_overflow:
    shr $31, %ebx
    mov $0x80000000, %eax
    sub %ebx, %eax
exit:
    call writei32
    call finish
