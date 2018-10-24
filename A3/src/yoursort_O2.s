	.file	"yoursort.c"
	.text
	.p2align 4,,15
	.globl	merge
	.type	merge, @function
merge:
.LFB32:
	.cfi_startproc
	subq	$424, %rsp
	.cfi_def_cfa_offset 432
	movq	%rsi, %r9
	movq	%fs:40, %rax
	movq	%rax, 408(%rsp)
	xorl	%eax, %eax
.L2:
	cmpq	%rdx, %r9
	jg	.L14
.L23:
	cmpq	%r8, %rcx
	jg	.L14
	movq	(%rdi,%r9,8), %r11
	movq	(%rdi,%rcx,8), %r10
	addq	$1, %rax
	cmpq	%r10, %r11
	jge	.L3
	addq	$1, %r9
	movq	%r11, -8(%rsp,%rax,8)
	cmpq	%rdx, %r9
	jle	.L23
.L14:
	cmpq	%rdx, %r9
	jg	.L7
	leaq	1(%rax,%rdx), %r10
	movq	%rsp, %rdx
	subq	%r9, %r10
	subq	%rax, %r9
	leaq	(%rdi,%r9,8), %r9
	.p2align 4,,10
	.p2align 3
.L8:
	addq	$1, %rax
	movq	-8(%r9,%rax,8), %rcx
	cmpq	%rax, %r10
	movq	%rcx, -8(%rdx,%rax,8)
	jne	.L8
.L9:
	cmpq	%r8, %rsi
	jg	.L1
	addq	$1, %r8
	xorl	%eax, %eax
	movq	%rsp, %rdx
	subq	%rsi, %r8
	leaq	(%rdi,%rsi,8), %rsi
.L12:
	movq	(%rdx,%rax,8), %rcx
	movq	%rcx, (%rsi,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %r8
	jne	.L12
.L1:
	movq	408(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L24
	addq	$424, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	addq	$1, %rcx
	movq	%r10, -8(%rsp,%rax,8)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	cmpq	%r8, %rcx
	jg	.L9
	leaq	1(%rax,%r8), %r9
	movq	%rsp, %rdx
	subq	%rcx, %r9
	subq	%rax, %rcx
	leaq	(%rdi,%rcx,8), %r10
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, %rax
	movq	-8(%r10,%rax,8), %rcx
	cmpq	%r9, %rax
	movq	%rcx, -8(%rdx,%rax,8)
	jne	.L10
	jmp	.L9
.L24:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE32:
	.size	merge, .-merge
	.p2align 4,,15
	.type	merge_sort.part.0, @function
merge_sort.part.0:
.LFB34:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	(%rsi,%rdx), %rbx
	movq	%rsi, %r12
	sarq	%rbx
	leaq	1(%rbx), %r14
	movq	%rbx, %rdx
	call	merge_sort
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%rbp, %rdi
	call	merge_sort
	movq	%r13, %r8
	movq	%r14, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	merge
	.cfi_endproc
.LFE34:
	.size	merge_sort.part.0, .-merge_sort.part.0
	.p2align 4,,15
	.globl	merge_sort
	.type	merge_sort, @function
merge_sort:
.LFB31:
	.cfi_startproc
	cmpq	%rdx, %rsi
	jl	.L29
	rep ret
	.p2align 4,,10
	.p2align 3
.L29:
	jmp	merge_sort.part.0
	.cfi_endproc
.LFE31:
	.size	merge_sort, .-merge_sort
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB33:
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
# 6 "x86prime_lib.h" 1
	in (0),%rax
# 0 "" 2
#NO_APP
	movq	%rax, %rbp
	andl	$2, %eax
	andl	$1, %ebp
#APP
# 6 "x86prime_lib.h" 1
	in (0),%r12
# 0 "" 2
#NO_APP
	leaq	allocator_base(%rip), %rdx
	leaq	0(,%r12,8), %rcx
	testq	%r12, %r12
	leaq	(%rcx,%rdx), %rbx
	jle	.L31
	movq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L32:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rax
# 0 "" 2
#NO_APP
	movq	%rax, (%rdx)
	addq	$8, %rdx
	cmpq	%rdx, %rbx
	jne	.L32
	testq	%rsi, %rsi
	leaq	(%rbx,%rcx), %rdx
	je	.L52
	movq	%rdx, cur_allocator(%rip)
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L36:
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L36
.L37:
	xorl	%esi, %esi
	movq	%r12, %rdx
	movq	%rbx, %rdi
	call	merge_sort.part.0
	xorl	%eax, %eax
	testq	%rbp, %rbp
	je	.L30
	.p2align 4,,10
	.p2align 3
.L39:
	movq	(%rbx,%rax,8), %rdx
#APP
# 17 "x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rax
	cmpq	%rax, %r12
	jg	.L39
.L30:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movq	%rdx, cur_allocator(%rip)
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L38:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L38
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L31:
	leaq	(%rbx,%rcx), %rdx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%rdx, cur_allocator(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
