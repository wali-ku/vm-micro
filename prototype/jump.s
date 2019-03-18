	.file	"jump.c"
	.text
	.section	.rodata
.LC0:
	.string	"[ERROR] Unexpected case\n!"
	.align 8
.LC1:
	.string	"[ERROR] Mismatch found: control = %d | test = %d | Iteration = %d\n"
	.align 8
.LC2:
	.string	"[STATUS] Successful Execution!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$10, -4(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L17:
	call	rand@PLT
	cltd
	idivl	-4(%rbp)
	movl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	cmpl	$10, %eax
	ja	.L3
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L5(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L3-.L5
	.long	.L4-.L5
	.long	.L6-.L5
	.long	.L7-.L5
	.long	.L8-.L5
	.long	.L9-.L5
	.long	.L10-.L5
	.long	.L11-.L5
	.long	.L12-.L5
	.long	.L13-.L5
	.long	.L14-.L5
	.text
.L4:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L6:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L7:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L8:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L9:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L10:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L11:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L12:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L13:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L14:
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	jmp	.L15
.L3:
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
.L15:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	je	.L16
	movl	-8(%rbp), %ecx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L17
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
