	.file	"sort.c"
	.text
	.p2align 4
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	(%rdi), %r12
	testq	%r12, %r12
	je	.L1
	movq	%rdi, %rbp
	leaq	-1(%r12), %rbx
	xorl	%edi, %edi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %r11
	subq	%rax, %r11
	je	.L7
	movq	8(%rbp), %r9
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	(%r9), %r8
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%rcx, (%r9,%r10,8)
	movq	%r8, (%rsi)
	cmpq	%r11, %rax
	jnb	.L7
.L5:
	addl	$1, %edx
	movq	%rax, %r10
	movl	%edx, %eax
	leaq	(%r9,%rax,8), %rsi
	movq	(%rsi), %rcx
	cmpq	%r8, %rcx
	jl	.L15
	movq	%rcx, %r8
	cmpq	%r11, %rax
	jb	.L5
.L7:
	leal	1(%rdi), %eax
	movq	%rax, %rdi
	cmpq	%r12, %rax
	jb	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE16:
	.size	bubble_sort, .-bubble_sort
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
