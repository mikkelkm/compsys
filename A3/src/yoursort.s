	.file	"b887a3f6645dfa2354e9d4df28fa0bfc.c"
	.text
	.globl	quick_sort
	.type	quick_sort, @function
quick_sort:
.LFB8:
	.cfi_startproc
	cmpq	%rdx, %rsi
	jge	.L10
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	(%rsi,%rdx), %rax
	sarq	%rax
	movq	(%rdi,%rax,8), %r9
	leaq	-1(%rsi), %r10
	leaq	1(%rdx), %rbx
.L3:
	addq	$1, %r10
	leaq	(%rdi,%r10,8), %rbp
	movq	0(%rbp), %r11
	cmpq	%r11, %r9
	jg	.L3
	jmp	.L5
.L7:
	movq	%rax, %rbx
.L5:
	leaq	-1(%rbx), %rax
	leaq	(%rdi,%rax,8), %rcx
	movq	(%rcx), %r8
	cmpq	%r8, %r9
	jl	.L7
	cmpq	%rax, %r10
	jge	.L6
	movq	%r8, 0(%rbp)
	movq	%r11, (%rcx)
	movq	%rax, %rbx
	jmp	.L3
.L6:
	movq	%rdx, %r12
	movq	%rdi, %rbp
	movq	%rax, %rdx
	call	quick_sort
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	quick_sort
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
.L10:
	rep ret
	.cfi_endproc
.LFE8:
	.size	quick_sort, .-quick_sort
	.globl	run
	.type	run, @function
run:
.LFB9:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rax
# 0 "" 2
#NO_APP
	movq	%rax, %r12
	andl	$1, %r12d
	andl	$2, %eax
	movq	%rax, %rdi
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, %rbx
	leaq	0(,%rdx,8), %rsi
	leaq	allocator_base(%rsi), %rax
	movq	%rax, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L12
.L13:
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, allocator_base(,%rax,8)
	addq	$1, %rax
.L12:
	cmpq	%rax, %rbx
	jg	.L13
	testq	%rdi, %rdi
	je	.L14
	movq	cur_allocator(%rip), %rbp
	addq	%rbp, %rsi
	movq	%rsi, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L15
.L16:
	leaq	0(%rbp,%rax,8), %rcx
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rsi
# 0 "" 2
#NO_APP
	movq	%rsi, (%rcx)
	addq	$1, %rax
.L15:
	cmpq	%rax, %rbx
	jg	.L16
	jmp	.L17
.L14:
	movq	cur_allocator(%rip), %rbp
	addq	%rbp, %rsi
	movq	%rsi, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L18
.L19:
	leaq	0(%rbp,%rax,8), %rcx
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rsi
# 0 "" 2
#NO_APP
	movq	%rsi, (%rcx)
	addq	$1, %rax
.L18:
	cmpq	%rax, %rbx
	jg	.L19
.L17:
	subq	$1, %rdx
	movl	$0, %esi
	movq	%rbp, %rdi
	call	quick_sort
	testq	%r12, %r12
	jne	.L23
	jmp	.L21
.L22:
	movq	0(%rbp,%rax,8), %rdx
#APP
# 17 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rax
	jmp	.L20
.L23:
	movl	$0, %eax
.L20:
	cmpq	%rax, %rbx
	jg	.L22
.L21:
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
