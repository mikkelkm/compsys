	.file	"yoursort.c"
	.text
	.p2align 4,,15
	.globl	quick_sort
	.type	quick_sort, @function
quick_sort:
.LFB8:
	.cfi_startproc
	cmpq	%rdx, %rsi
	jge	.L11
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	1(%rdx), %rbx
	movq	%rdi, %r12
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L7:
	leaq	(%rsi,%r13), %rax
	leaq	-1(%rsi), %r8
	movq	%rbx, %rbp
	sarq	%rax
	movq	(%r12,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %r8
	movq	(%r12,%r8,8), %r10
	cmpq	%rdi, %r10
	jl	.L3
	leaq	-1(%rbp), %rdx
	leaq	(%r12,%rdx,8), %rax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rdx, %rbp
	subq	$1, %rdx
.L5:
	movq	%rax, %r9
	subq	$8, %rax
	movq	8(%rax), %rcx
	cmpq	%rdi, %rcx
	jg	.L8
	cmpq	%rdx, %r8
	jge	.L6
	movq	%rcx, (%r12,%r8,8)
	movq	%rdx, %rbp
	movq	%r10, (%r9)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, %rdi
	call	quick_sort
	cmpq	%rbp, %r13
	movq	%rbp, %rsi
	jg	.L7
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	rep ret
	.cfi_endproc
.LFE8:
	.size	quick_sort, .-quick_sort
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rax
# 0 "" 2
#NO_APP
	movq	%rax, %rbx
	andl	$2, %eax
	andl	$1, %ebx
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rbp
# 0 "" 2
#NO_APP
	leaq	allocator_base(%rip), %rcx
	leaq	0(,%rbp,8), %rsi
	testq	%rbp, %rbp
	leaq	(%rsi,%rcx), %r11
	jle	.L16
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L17:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rax
# 0 "" 2
#NO_APP
	movq	%rax, (%rcx)
	addq	$8, %rcx
	cmpq	%rcx, %r11
	jne	.L17
	testq	%rdx, %rdx
	leaq	(%r11,%rsi), %rcx
	je	.L37
	movq	%rcx, cur_allocator(%rip)
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L21:
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rcx
	jne	.L21
.L22:
	leaq	-1(%rbp), %rdx
	xorl	%esi, %esi
	movq	%r11, %rdi
	call	quick_sort
	xorl	%eax, %eax
	testq	%rbx, %rbx
	je	.L15
	.p2align 4,,10
	.p2align 3
.L24:
	movq	(%r11,%rax,8), %rdx
#APP
# 17 "x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rax
	cmpq	%rax, %rbp
	jg	.L24
.L15:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r11, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movq	%rcx, cur_allocator(%rip)
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L23:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L23
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L16:
	leaq	(%r11,%rsi), %rcx
	leaq	-1(%rbp), %rdx
	xorl	%esi, %esi
	movq	%r11, %rdi
	movq	%rcx, cur_allocator(%rip)
	call	quick_sort
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r11, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
