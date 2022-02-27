.global mul2


# main:
   #  mov OFFSET value, %eax
    # push %eax
    # call mul2
    # mov value, %eax
    # call writei32
#     call finish

mul2:
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %ecx
    mov (%ecx), %eax
    # call writei32
    mov %eax, %ecx
    add %eax, %ecx
    jo exit
    jmp div2
div2:
    add %eax, %eax 
exit:
    # mov %eax, value
    mov 8(%ebp), %ecx
    mov %eax, (%ecx)
    mov %ebp, %esp
    pop %ebp
    ret

# .data
# value:
#     .int 42
