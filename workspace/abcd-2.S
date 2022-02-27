.global process

# main:
#     mov $-1, %eax
#     mov %eax, A
#     mov $-100, %eax
#     mov %eax, B
#     call process
#     mov R, %eax
#     call writei32
#     call finish

process:
    push %ebp
    push %ebx
    mov %esp, %ebp
    
    mov A, %eax
    shr $31, %eax
    mov %eax, %ebx
    mov B, %eax
    shr $31, %eax
    xor %eax, %ebx

    mov $0, %ecx
    mov %ecx, R

    cmp $0, A
    jge next_A

    mov $0, %eax
    sub A, %eax
    mov %eax, A
   
next_A:
    cmp $0, B
    jge next_B

    mov $0, %eax
    sub B, %eax
    mov %eax, B
    
next_B:    
    mov $-1, %eax
    mov $1, %ecx

loop: 
    add $1, %eax
    cmp $31, %eax
    jz end_loop
        
    test %ecx, A
    jz tail
    mov B, %edx
    add %edx, R

tail:
    mov B, %edx
    shl $1, %edx
    mov %edx, B
    shl $1, %ecx
    jmp loop

end_loop:
    cmp $1, %ebx
    jnz exit

    mov $0, %eax
    sub R, %eax
    mov %eax, R    

exit:
    mov %ebp, %esp
    pop %ebx
    pop %ebp
    ret

.data
.global A
A:
    .skip 4
.global B
B:
    .skip 4
.global R
R:
    .skip 4



