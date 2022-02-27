.global process


process:
    push %ebp
    mov %esp, %ebp
    mov $0, %ecx

read:
    call readi32
    jc write
    sub $4, %esp
    mov %eax, (%esp)
    add $1, %ecx
    jmp read
    
write:
    test %ecx, %ecx
    jz exit_process
    mov (%esp), %eax
    call writei32
    sub $1, %ecx
    add $4, %esp
    jmp write

exit_process:    
    mov %ebp, %esp
    pop %ebp
    ret

