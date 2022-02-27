.global main

main:
    mov $0, %ebx
 
main_loop:
    add $1, %ebx
    call readi32
    jc exit
    cmp $0, %eax
    jl pop_elem    
    jmp push_elem

exit:
    call finish

push_elem:
    shl $3, %eax
    add $stack, %eax
    mov $4, %edx
    mov %eax, stack(%edx, %ebx, 8)
    call readi32
    mov %eax, stack(, %ebx, 8)
    jmp main_loop
    
pop_elem:
    mov $0, %edx
    sub %eax, %edx
    mov %edx, %eax
    cmp %eax, %ebx
    jl max_elem
    
    shl $3, %eax
    add $stack, %eax

    cmp $0, 4(%eax)
    jz max_elem

    mov (%eax), %ecx
    mov 4(%eax), %edx
    mov (%edx), %edx
    mov %edx, (%eax)

    mov 4(%eax), %edx
    mov 4(%edx), %edx
    mov %edx, 4(%eax)

    mov %ecx, %eax
    call writei32
    jmp main_loop
    
    
max_elem:
    mov $-1, %eax
    call writei32
    jmp main_loop

.data
stack:    
    .skip 8008
