bubble_sort(ll_array_t*):
        push    r12
        push    rbp
        push    rbx
        mov     rbp, QWORD PTR [rdi]
        test    rbp, rbp
        je      .L1
        mov     r12, rdi
        lea     rbx, [rbp-1]
        xor     r11d, r11d
        xor     eax, eax
.L7:
        mov     r10, rbx
        sub     r10, rax
        je      .L3
        mov     r8, QWORD PTR [r12+8]
        xor     edx, edx
        xor     eax, eax
        mov     rdi, QWORD PTR [r8]
        jmp     .L4
.L15:
        mov     QWORD PTR [r8+r9*8], rcx
        mov     QWORD PTR [rsi], rdi
        cmp     rax, r10
        jnb     .L3
.L4:
        add     edx, 1
        mov     r9, rax
        mov     eax, edx
        lea     rsi, [r8+rax*8]
        mov     rcx, QWORD PTR [rsi]
        cmp     rcx, rdi
        jl      .L15
        mov     rdi, rcx
        cmp     rax, r10
        jb      .L4
.L3:
        lea     eax, [r11+1]
        mov     r11, rax
        cmp     rax, rbp
        jb      .L7
.L1:
        pop     rbx
        pop     rbp
        pop     r12
        ret
