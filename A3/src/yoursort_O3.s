	.file	"yoursort.c"
	.text
	.p2align 4,,15
	.globl	merge
	.type	merge, @function
merge:
.LFB32:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	movq	%rcx, %rbp
	movq	%r8, %r14
	movq	%rsi, %r12
	subq	$440, %rsp
	.cfi_def_cfa_offset 496
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	cmpq	%rdx, %rsi
	jg	.L4
	cmpq	%r8, %rcx
	jg	.L4
	movq	(%rdi,%rbp,8), %rax
	movq	(%rdi,%rsi,8), %rcx
	leaq	16(%rsp), %rsi
.L2:
	addq	$1, %rbx
	cmpq	%rax, %rcx
	jge	.L5
.L29:
	addq	$1, %r12
	cmpq	%rbp, %r14
	movq	%rcx, -8(%rsi,%rbx,8)
	jl	.L4
	cmpq	%rdx, %r12
	jg	.L4
	movq	(%r15,%r12,8), %rcx
	addq	$1, %rbx
	cmpq	%rax, %rcx
	jl	.L29
.L5:
	addq	$1, %rbp
	cmpq	%r12, %rdx
	movq	%rax, -8(%rsi,%rbx,8)
	jl	.L4
	cmpq	%r14, %rbp
	jg	.L4
	movq	(%r15,%rbp,8), %rax
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	cmpq	%r12, %rdx
	jl	.L10
	leaq	1(%rdx), %rcx
	leaq	16(%rsp,%rbx,8), %rdi
	leaq	(%r15,%r12,8), %rsi
	movq	%rcx, %rdx
	movq	%rcx, 8(%rsp)
	subq	%r12, %rdx
	salq	$3, %rdx
	call	memcpy@PLT
	movq	8(%rsp), %rcx
	addq	%rcx, %rbx
	subq	%r12, %rbx
.L10:
	cmpq	%rbp, %r14
	jl	.L11
	movq	%r14, %rax
	leaq	16(%rsp,%rbx,8), %rdi
	leaq	(%r15,%rbp,8), %rsi
	subq	%rbp, %rax
	leaq	8(,%rax,8), %rdx
	call	memcpy@PLT
.L11:
	cmpq	%r14, %r13
	jg	.L1
	subq	%r13, %r14
	leaq	(%r15,%r13,8), %rdi
	leaq	16(%rsp), %rsi
	leaq	8(,%r14,8), %rdx
	call	memcpy@PLT
.L1:
	movq	424(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L30
	addq	$440, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L30:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE32:
	.size	merge, .-merge
	.p2align 4,,15
	.type	merge_sort.part.0, @function
merge_sort.part.0:
.LFB34:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	(%rsi,%rdx), %rbx
	movq	%rsi, %r12
	sarq	%rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpq	%rbx, %rsi
	jl	.L39
	leaq	1(%rbx), %rbp
	cmpq	%rbp, %r13
	jg	.L40
.L35:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	merge
	.p2align 4,,10
	.p2align 3
.L39:
	.cfi_restore_state
	leaq	(%rsi,%rbx), %rbp
	sarq	%rbp
	cmpq	%rbp, %rsi
	jl	.L41
.L33:
	leaq	1(%rbp), %rcx
	cmpq	%rcx, %rbx
	jg	.L42
.L34:
	movq	%rbp, %rdx
	leaq	1(%rbx), %rbp
	movq	%rbx, %r8
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	merge
	cmpq	%rbp, %r13
	jle	.L35
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	0(%r13,%rbp), %r15
	sarq	%r15
	cmpq	%r15, %rbp
	jl	.L43
.L36:
	leaq	1(%r15), %rcx
	cmpq	%rcx, %r13
	jg	.L44
.L37:
	movq	%r13, %r8
	movq	%r15, %rdx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	merge
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rbp, %rdx
	call	merge_sort.part.0
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rcx, %rsi
	movq	%r13, %rdx
	movq	%r14, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%r15, %rdx
	movq	%rbp, %rsi
	movq	%r14, %rdi
	call	merge_sort.part.0
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rcx, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L34
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
	jl	.L56
	rep ret
	.p2align 4,,10
	.p2align 3
.L56:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	(%rsi,%rdx), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	sarq	%r13
	movq	%rsi, %rbx
	movq	%rdi, %r12
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpq	%r13, %rsi
	jl	.L57
.L47:
	leaq	1(%r13), %r14
	cmpq	%r14, %rbp
	jg	.L58
.L50:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %r8
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	merge
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore_state
	leaq	(%rsi,%r13), %r14
	sarq	%r14
	cmpq	%r14, %rsi
	jl	.L59
.L48:
	leaq	1(%r14), %rcx
	cmpq	%rcx, %r13
	jg	.L60
.L49:
	movq	%r13, %r8
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	merge
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L58:
	leaq	0(%rbp,%r14), %r15
	sarq	%r15
	cmpq	%r15, %r14
	jl	.L61
.L51:
	leaq	1(%r15), %rcx
	cmpq	%rcx, %rbp
	jg	.L62
.L52:
	movq	%rbp, %r8
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	merge
	jmp	.L50
.L60:
	movq	%rcx, %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L49
.L59:
	movq	%r14, %rdx
	call	merge_sort.part.0
	jmp	.L48
.L62:
	movq	%rcx, %rsi
	movq	%rbp, %rdx
	movq	%r12, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L52
.L61:
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	merge_sort.part.0
	jmp	.L51
	.cfi_endproc
.LFE31:
	.size	merge_sort, .-merge_sort
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB33:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
#APP
# 6 "x86prime_lib.h" 1
	in (0),%r12
# 0 "" 2
#NO_APP
	movq	%r12, %rsi
	andl	$2, %esi
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rbp
# 0 "" 2
#NO_APP
	leaq	allocator_base(%rip), %rdx
	leaq	0(,%rbp,8), %rcx
	testq	%rbp, %rbp
	leaq	(%rcx,%rdx), %rbx
	jle	.L64
	.p2align 4,,10
	.p2align 3
.L65:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rax
# 0 "" 2
#NO_APP
	movq	%rax, (%rdx)
	addq	$8, %rdx
	cmpq	%rbx, %rdx
	jne	.L65
	testq	%rsi, %rsi
	leaq	(%rbx,%rcx), %rdx
	je	.L97
	movq	%rdx, cur_allocator(%rip)
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L69:
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L69
	movq	%rbp, %r14
	movl	$1, %r13d
	sarq	%r14
	jne	.L98
.L74:
	xorl	%esi, %esi
	movq	%rbp, %r8
	movq	%r13, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rdi
	call	merge
	andl	$1, %r12d
	je	.L63
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L78:
	movq	(%rbx,%rax,8), %rdx
#APP
# 17 "x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rax
	cmpq	%rax, %rbp
	jg	.L78
.L63:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	.cfi_restore_state
	movq	%rdx, cur_allocator(%rip)
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L71:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L71
	movq	%rbp, %r14
	movl	$1, %r13d
	sarq	%r14
	je	.L74
.L98:
	movq	%rbp, %r13
	sarq	$2, %r13
	testq	%r13, %r13
	jne	.L99
.L72:
	leaq	1(%r13), %rcx
	cmpq	%rcx, %r14
	jg	.L100
.L73:
	movq	%r13, %rdx
	leaq	1(%r14), %r13
	xorl	%esi, %esi
	movq	%r14, %r8
	movq	%rbx, %rdi
	call	merge
	cmpq	%r13, %rbp
	jle	.L74
	leaq	0(%rbp,%r13), %r15
	sarq	%r15
	cmpq	%r15, %r13
	jl	.L101
.L75:
	leaq	1(%r15), %rcx
	cmpq	%rcx, %rbp
	jg	.L102
.L76:
	movq	%rbp, %r8
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	merge
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L64:
	leaq	(%rbx,%rcx), %rdx
	movq	%rdx, cur_allocator(%rip)
	jmp	.L63
.L99:
	movq	%r13, %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	merge_sort.part.0
	jmp	.L72
.L102:
	movq	%rcx, %rsi
	movq	%rbp, %rdx
	movq	%rbx, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L76
.L101:
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	merge_sort.part.0
	jmp	.L75
.L100:
	movq	%rcx, %rsi
	movq	%r14, %rdx
	movq	%rbx, %rdi
	movq	%rcx, 8(%rsp)
	call	merge_sort.part.0
	movq	8(%rsp), %rcx
	jmp	.L73
	.cfi_endproc
.LFE33:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
