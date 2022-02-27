.global main

main:
    mov (count), %eax
    call writei32
loop_read:
    cmp $2, ind
    jz loop_check

    mov $3, %eax
    mov $0, %ebx
    mov $symb, %ecx
    mov $1, %edx

    int $0x80

    mov symb, %al
    cmp $' ', %al
    jz loop_read
    cmp $'\n', %al
    jnz next_read
    add $1, ind
    jmp loop_read

next_read:
    mov $0, %eax
    mov symb, %al 
    
    shl $2, %eax 
    mov $count, %ebx
    add %eax, %ebx
    mov $1, %ecx
    cmp $0, ind
    jz first
    jmp second
    

first:
    add %ecx, (%ebx)    
    jmp loop_read
second:
    sub %ecx, (%ebx)
    jmp loop_read

check:
    mov $count, %eax
    mov %eax, ind
loop_check:
    mov $1024, %eax
    cmp %eax, ind
    jz good
    
    mov $0, %eax
    cmp %eax, (ind)
    jnz bad

    mov $4, %eax
    add %eax, ind
    jmp loop_check

good:
    mov $yes, %ecx
    mov $4, %edx
    jmp end
bad:
    mov $no, %ecx
    mov $3, %edx
    jmp end

end:
    mov $4, %eax
    mov $1, %ebx
    int $0x80

    call finish


.data
count: 
    .skip 1024
symb: 
    .skip 1
ind:
    .int 0
yes:
    .ascii "YES\n"
no:
    .ascii "NO\n"