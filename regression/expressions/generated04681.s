	.global	main
	.data
global_x0:	.int	0
global_x1:	.int	0
global_y:	.int	0
	.text
main:
	pushl	%ebp
	movl	%esp,	%ebp
	subl	$0,	%esp
# READ
	call	Lread
	movl	%eax,	%ebx
# ST x0
	movl	%ebx,	global_x0
# READ
	call	Lread
	movl	%eax,	%ebx
# ST x1
	movl	%ebx,	global_x1
# CONST 22
	movl	$22,	%ebx
# CONST 23
	movl	$23,	%ecx
# BINOP *
	imull	%ecx,	%ebx
# CONST 29
	movl	$29,	%ecx
# BINOP +
	addl	%ecx,	%ebx
# CONST 35
	movl	$35,	%ecx
# LD x0
	movl	global_x0,	%esi
	pushl	%esi
# BINOP *
	imull	%esi,	%ecx
# BINOP +
	addl	%ecx,	%ebx
# ST y
	movl	%ebx,	global_y
# LD y
	movl	global_y,	%ebx
	pushl	%ebx
# WRITE
	pushl	%ebx
	call	Lwrite
	popl	%eax
	movl	%ebp,	%esp
	popl	%ebp
	xorl	%eax,	%eax
	ret