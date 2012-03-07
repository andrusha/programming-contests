	.file	"1_double_squares.c"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L3
	movl	$2, %eax
	jmp	.L1
.L3:
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.globl init
	.type	init, @function
init:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$185364, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L5
.L6:
	mov	-4(%rbp), %eax
	salq	$2, %rax
	addq	-16(%rbp), %rax
	movl	-4(%rbp), %edx
	imull	-4(%rbp), %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L5:
	cmpl	$46340, -4(%rbp)
	jbe	.L6
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	init, .-init
	.ident	"GCC: (Gentoo 4.5.2 p1.0, pie-0.4.5) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
