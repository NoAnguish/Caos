.global main

main:
    call sub_p
    call writei32
    call finish

sub_p:
    push %ebp
    mov %esp, %ebp
    jmp process

# process:
#     mov $4, %eax
#     mov %ebp, %esp
#     pop %ebp
#     ret
