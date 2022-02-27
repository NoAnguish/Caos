.data
    .global discrim

discrim:
    push %ebp
    mov %esp, %ebp

    movsd 12(%ebp), %xmm0
    mulss %xmm0, %xmm0
    
    movsd 8(%ebp), %xmm1
    movsd 16(%ebp), %xmm2
    mulss %xmm2, %xmm1

    subss %xmm1, %xmm0
    subss %xmm1, %xmm0
    subss %xmm1, %xmm0
    subss %xmm1, %xmm0

    mov 20(%ebp), %eax
    movsd %xmm0, (%eax)

    mov %ebp, %esp
    pop %ebp
    ret