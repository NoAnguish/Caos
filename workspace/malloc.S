#include <sys/syscall.h>
.global alloc_mem

# main:
#     mov $freelist, %ecx
#     mov $4, %ebx
#     mov %ebx, (%ecx)
#     mov $freelist, %eax
#     call writei32
#     add $8, %eax
#     mov %eax, 4(%ecx)
#     mov $8, %ebx
#     mov %ebx, 8(%ecx)
#     mov $0, %ebx
#     mov %ebx, 12(%ecx)
    
#     push $1;
#     call alloc_mem
#     call writei32
#     mov $freelist, %eax
#     call writei32
#     call finish

alloc_mem:
head:
    push %ebp
    push %ebx 
    mov %esp, %ebp
    mov 12(%esp), %edx
    mov $0, %ecx
    mov freelist, %eax
find_block:
    cmp %edx, (%eax)
    jge return_block
    mov 4(%eax), %ebx
    test %ebx, %ebx
    jz alloc_block
    mov %eax, %ecx
    add $4, %ecx
    mov 4(%eax), %eax
    jmp find_block

return_block:
    mov 4(%eax), %ebx
    test %ecx, %ecx
    jnz next_block

first_block:
    mov %ebx, freelist
    jmp tail

next_block:
    mov %ebx, (%ecx)
    add $4, %eax
    jmp tail

alloc_block:
    mov $SYS_brk, %eax
    mov $0, %ebx
    int $0x80
    mov %eax, %ebx
    mov %eax, %ecx

    test %edx, %edx
    jnz continue
    add $4, %edx

continue:
    add $3, %edx
    shr $2, %edx
    shl $2, %edx
    add $4, %edx
    mov $SYS_brk, %eax
    add %edx, %ebx
    int $0x80
    
    add %edx, %ecx
    sub %eax, %ecx
    jz correct
    mov $0, %eax
    jmp tail
correct:
    sub $4, %edx
    mov %edx, (%eax)
    add $4, %eax
tail:
    mov %ebp, %esp
    pop %ebx
    pop %ebp
    ret

# .data
# freelist:
#     .skip 20
