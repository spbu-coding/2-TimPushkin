	.file	"sort.c"
	.text
	.p2align 4,,15
	.globl	bubble_sort
	.def	bubble_sort;	.scl	2;	.type	32;	.endef
	.seh_proc	bubble_sort
bubble_sort:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	.seh_endprologue
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	movq	(%rcx), %rsi
	testq	%rsi, %rsi
	je	.L1
	.p2align 4,,10
.L2:
	leaq	-1(%rsi), %rax
	cmpq	%rax, %rdi
	je	.L7
	movq	8(%rcx), %rbx
	xorl	%edx, %edx
	xorl	%eax, %eax
	notq	%rdi
	.p2align 4,,10
.L4:
	leaq	(%rbx,%rax,8), %r10
	leal	1(%rdx), %eax
	movq	(%r10), %r9
	leaq	(%rbx,%rax,8), %r8
	movq	%rax, %rdx
	movq	(%r8), %r11
	cmpq	%r11, %r9
	jle	.L5
	movq	%r11, (%r10)
	movq	%r9, (%r8)
	movq	(%rcx), %rsi
	leaq	(%rdi,%rsi), %r8
	cmpq	%r8, %rax
	jb	.L4
.L7:
	leal	1(%rbp), %edi
	cmpq	%rsi, %rdi
	movq	%rdi, %rbp
	jb	.L2
.L1:
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
.L5:
	leaq	(%rdi,%rsi), %r8
	cmpq	%r8, %rax
	jb	.L4
	leal	1(%rbp), %edi
	cmpq	%rsi, %rdi
	movq	%rdi, %rbp
	jb	.L2
	jmp	.L1
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
