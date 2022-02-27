.global list_reverse


list_reverse:
    push %ebp
    mov %esp, %ebp
    mov head, %eax
    cmp $0, %eax
    jz end
    mov $0, %ecx

loop:
    cmp $0, 8(%eax)
    jz tail
    
    mov 8(%eax), %edx
    mov %ecx, 8(%eax)
    mov %eax, %ecx
    mov %edx, %eax
    jmp loop


tail:
    mov %ecx, 8(%eax)
    mov %eax, head
end:
    mov %ebp, %esp
    pop %ebp
    ret
