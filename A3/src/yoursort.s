	.file	"6dab49d06167be7d4d501abb09dc86fc.c"
	.text
	.globl	your_sort
	.type	your_sort, @function
your_sort:
.LFB8:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE8:
	.size	your_sort, .-your_sort
	.globl	run
	.type	run, @function
run:
.LFB9:
	.cfi_startproc
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rax
# 0 "" 2
#NO_APP
	movq	%rax, %r8
	andl	$1, %r8d
	andl	$2, %eax
	movq	%rax, %rdi
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rsi
# 0 "" 2
#NO_APP
	movq	%rsi, %rdx
	salq	$3, %rsi
	leaq	allocator_base(%rsi), %rax
	movq	%rax, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L3
.L4:
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, allocator_base(,%rax,8)
	addq	$1, %rax
.L3:
	cmpq	%rax, %rdx
	jg	.L4
	testq	%rdi, %rdi
	je	.L5
	movq	cur_allocator(%rip), %rax
	addq	%rax, %rsi
	movq	%rsi, cur_allocator(%rip)
	movl	$0, %ecx
	jmp	.L6
.L7:
	leaq	(%rax,%rcx,8), %rsi
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rdi
# 0 "" 2
#NO_APP
	movq	%rdi, (%rsi)
	addq	$1, %rcx
.L6:
	cmpq	%rcx, %rdx
	jg	.L7
	jmp	.L8
.L5:
	movq	cur_allocator(%rip), %rax
	addq	%rax, %rsi
	movq	%rsi, cur_allocator(%rip)
	movl	$0, %ecx
	jmp	.L9
.L10:
	leaq	(%rax,%rcx,8), %rsi
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rdi
# 0 "" 2
#NO_APP
	movq	%rdi, (%rsi)
	addq	$1, %rcx
.L9:
	cmpq	%rcx, %rdx
	jg	.L10
.L8:
	testq	%r8, %r8
	jne	.L14
	rep ret
.L13:
	movq	(%rax,%rcx,8), %rsi
#APP
# 17 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	out %rsi,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rcx
	jmp	.L11
.L14:
	movl	$0, %ecx
.L11:
	cmpq	%rcx, %rdx
	jg	.L13
	rep ret
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
