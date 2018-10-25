	.file	"yoursort.c"
	.text
	.p2align 4,,15
	.globl	quick_sort
	.type	quick_sort, @function
quick_sort:
.LFB8:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	cmpq	%rdx, %rsi
	movq	%rdx, 112(%rsp)
	jge	.L1
	movq	%rdx, %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	addq	$1, %rax
	movq	%rax, 168(%rsp)
.L8:
	movq	112(%rsp), %rax
	leaq	-1(%r8), %r11
	movq	168(%rsp), %rdx
	addq	%r8, %rax
	sarq	%rax
	movq	(%r9,%rax,8), %rsi
	movq	%r11, %rax
.L3:
	addq	$1, %rax
	movq	(%r9,%rax,8), %rbx
	cmpq	%rsi, %rbx
	jl	.L3
	leaq	-1(%rdx), %rcx
	movq	%rdx, %r12
	leaq	(%r9,%rcx,8), %rdi
.L5:
	movq	%rdi, %rbp
	subq	$8, %rdi
	movq	8(%rdi), %r10
	movq	%rcx, %rdx
	cmpq	%rsi, %r10
	jle	.L91
	movq	%rcx, %r12
	subq	$1, %rcx
	jmp	.L5
.L91:
	cmpq	%rcx, %rax
	jge	.L6
	movq	%r10, (%r9,%rax,8)
	movq	%rbx, 0(%rbp)
	jmp	.L3
.L15:
	movq	32(%rsp), %r8
	cmpq	%r8, 112(%rsp)
	jg	.L8
.L1:
	addq	$184, %rsp
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
.L6:
	.cfi_restore_state
	cmpq	%r8, %rcx
	movq	%rbp, 128(%rsp)
	movq	%r12, 32(%rsp)
	movq	%rcx, 120(%rsp)
	jle	.L15
.L7:
	movq	120(%rsp), %rax
	movq	32(%rsp), %rsi
	addq	%r8, %rax
	sarq	%rax
	movq	(%r9,%rax,8), %rdx
	movq	%r11, %rax
.L9:
	addq	$1, %rax
	movq	(%r9,%rax,8), %rbx
	cmpq	%rbx, %rdx
	jg	.L9
	cmpq	%r10, %rdx
	leaq	-1(%rsi), %rcx
	jge	.L11
.L92:
	movq	-8(%r9,%rcx,8), %r10
	movq	%rcx, %rsi
	leaq	-1(%rsi), %rcx
	cmpq	%r10, %rdx
	jl	.L92
.L11:
	leaq	0(,%rcx,8), %rdi
	cmpq	%rcx, %rax
	leaq	(%r9,%rdi), %rbp
	jge	.L13
	movq	%r10, (%r9,%rax,8)
	movq	%rcx, %rsi
	movq	%rbx, 0(%rbp)
	movq	-8(%r9,%rdi), %r10
	jmp	.L9
.L13:
	cmpq	%r8, %rcx
	movq	%rsi, 40(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rbp, 136(%rsp)
	jle	.L22
.L14:
	movq	48(%rsp), %rax
	addq	%r8, %rax
	sarq	%rax
	movq	(%r9,%rax,8), %rdx
	movq	%r11, %rax
.L16:
	addq	$1, %rax
	movq	(%r9,%rax,8), %rbx
	cmpq	%rbx, %rdx
	jg	.L16
	cmpq	%r10, %rdx
	leaq	-1(%rsi), %rcx
	jge	.L18
.L93:
	movq	-8(%r9,%rcx,8), %r10
	movq	%rcx, %rsi
	leaq	-1(%rsi), %rcx
	cmpq	%r10, %rdx
	jl	.L93
.L18:
	leaq	0(,%rcx,8), %rdi
	cmpq	%rcx, %rax
	leaq	(%r9,%rdi), %rbp
	jge	.L20
	movq	%r10, (%r9,%rax,8)
	movq	%rcx, %rsi
	movq	%rbx, 0(%rbp)
	movq	-8(%r9,%rdi), %r10
	jmp	.L16
.L20:
	cmpq	%r8, %rcx
	movq	%rsi, 56(%rsp)
	movq	%rcx, 64(%rsp)
	movq	%rbp, 144(%rsp)
	jle	.L29
.L21:
	movq	64(%rsp), %rax
	movq	%r11, %rdx
	addq	%r8, %rax
	sarq	%rax
	movq	(%r9,%rax,8), %rax
.L23:
	addq	$1, %rdx
	movq	(%r9,%rdx,8), %rdi
	cmpq	%rdi, %rax
	jg	.L23
	cmpq	%r10, %rax
	leaq	-1(%rsi), %rcx
	jge	.L25
.L94:
	movq	-8(%r9,%rcx,8), %r10
	movq	%rcx, %rsi
	leaq	-1(%rsi), %rcx
	cmpq	%r10, %rax
	jl	.L94
.L25:
	leaq	0(,%rcx,8), %rbx
	cmpq	%rcx, %rdx
	leaq	(%r9,%rbx), %rbp
	jge	.L27
	movq	%r10, (%r9,%rdx,8)
	movq	%rcx, %rsi
	movq	%rdi, 0(%rbp)
	movq	-8(%r9,%rbx), %r10
	jmp	.L23
.L27:
	cmpq	%r8, %rcx
	movq	%rsi, 72(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rbp, 152(%rsp)
	jle	.L36
.L28:
	movq	80(%rsp), %rax
	movq	%r11, %rdx
	addq	%r8, %rax
	sarq	%rax
	movq	(%r9,%rax,8), %rax
.L30:
	addq	$1, %rdx
	movq	(%r9,%rdx,8), %rdi
	cmpq	%rdi, %rax
	jg	.L30
	cmpq	%r10, %rax
	leaq	-1(%rsi), %rcx
	jge	.L32
	.p2align 4,,10
	.p2align 3
.L95:
	movq	-8(%r9,%rcx,8), %r10
	movq	%rcx, %rsi
	leaq	-1(%rsi), %rcx
	cmpq	%r10, %rax
	jl	.L95
.L32:
	leaq	0(,%rcx,8), %rbx
	cmpq	%rcx, %rdx
	leaq	(%r9,%rbx), %rbp
	jge	.L34
	movq	%r10, (%r9,%rdx,8)
	movq	%rcx, %rsi
	movq	%rdi, 0(%rbp)
	movq	-8(%r9,%rbx), %r10
	jmp	.L30
.L34:
	cmpq	%r8, %rcx
	movq	%rsi, 88(%rsp)
	movq	%rcx, 96(%rsp)
	movq	%rbp, 160(%rsp)
	jle	.L96
	movq	%r9, %rbx
	movq	%rcx, %rax
	movq	%r8, %r9
.L35:
	addq	%r9, %rax
	movq	88(%rsp), %rcx
	movq	%r11, %rdx
	sarq	%rax
	movq	(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L37:
	addq	$1, %rdx
	movq	(%rbx,%rdx,8), %rsi
	cmpq	%rsi, %rax
	jg	.L37
	cmpq	%r10, %rax
	leaq	-1(%rcx), %r8
	jge	.L39
	.p2align 4,,10
	.p2align 3
.L97:
	movq	-8(%rbx,%r8,8), %r10
	movq	%r8, %rcx
	leaq	-1(%rcx), %r8
	cmpq	%r10, %rax
	jl	.L97
.L39:
	leaq	0(,%r8,8), %rdi
	cmpq	%r8, %rdx
	leaq	(%rbx,%rdi), %rbp
	jge	.L41
	movq	%r10, (%rbx,%rdx,8)
	movq	%r8, %rcx
	movq	%rsi, 0(%rbp)
	movq	-8(%rbx,%rdi), %r10
	jmp	.L37
.L41:
	cmpq	%r8, %r9
	movq	%rcx, 24(%rsp)
	movq	%rbp, 104(%rsp)
	jge	.L50
	movq	%r8, 16(%rsp)
	movq	%r9, %rsi
	movq	%r11, %r8
	movq	%rcx, %r15
.L42:
	movq	16(%rsp), %rax
	movq	%r8, %rdx
	addq	%rsi, %rax
	sarq	%rax
	movq	(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L44:
	addq	$1, %rdx
	movq	(%rbx,%rdx,8), %rcx
	cmpq	%rcx, %rax
	jg	.L44
	cmpq	%r10, %rax
	leaq	-1(%r15), %r14
	jge	.L46
	.p2align 4,,10
	.p2align 3
.L98:
	movq	-8(%rbx,%r14,8), %r10
	movq	%r14, %r15
	leaq	-1(%r15), %r14
	cmpq	%r10, %rax
	jl	.L98
.L46:
	leaq	0(,%r14,8), %rdi
	cmpq	%r14, %rdx
	leaq	(%rbx,%rdi), %r9
	jge	.L48
	movq	%r10, (%rbx,%rdx,8)
	movq	%r14, %r15
	movq	%rcx, (%r9)
	movq	-8(%rbx,%rdi), %r10
	jmp	.L44
.L48:
	cmpq	%r14, %rsi
	jge	.L57
	movq	%r9, 8(%rsp)
.L49:
	leaq	(%rsi,%r14), %rax
	movq	%r8, %rdx
	movq	%r15, %r13
	sarq	%rax
	movq	(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L51:
	addq	$1, %rdx
	movq	(%rbx,%rdx,8), %rcx
	cmpq	%rcx, %rax
	jg	.L51
	cmpq	%r10, %rax
	leaq	-1(%r13), %r12
	jge	.L53
	.p2align 4,,10
	.p2align 3
.L99:
	movq	-8(%rbx,%r12,8), %r10
	movq	%r12, %r13
	leaq	-1(%r13), %r12
	cmpq	%r10, %rax
	jl	.L99
.L53:
	leaq	0(,%r12,8), %rdi
	cmpq	%r12, %rdx
	leaq	(%rbx,%rdi), %r9
	jge	.L55
	movq	%r10, (%rbx,%rdx,8)
	movq	%r12, %r13
	movq	%rcx, (%r9)
	movq	-8(%rbx,%rdi), %r10
	jmp	.L51
.L55:
	cmpq	%r12, %rsi
	jge	.L62
.L56:
	leaq	(%rsi,%r12), %rax
	movq	%r13, %rbp
	sarq	%rax
	movq	(%rbx,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L58:
	addq	$1, %r8
	movq	(%rbx,%r8,8), %r10
	cmpq	%r10, %rdi
	jg	.L58
	leaq	-1(%rbp), %rdx
	leaq	(%rbx,%rdx,8), %rax
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%rdx, %rbp
	subq	$1, %rdx
.L60:
	movq	%rax, %r9
	subq	$8, %rax
	movq	8(%rax), %rcx
	cmpq	%rcx, %rdi
	jl	.L64
	cmpq	%rdx, %r8
	jge	.L61
	movq	%rcx, (%rbx,%r8,8)
	movq	%rdx, %rbp
	movq	%r10, (%r9)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L61:
	movq	%rbx, %rdi
	call	quick_sort
	cmpq	%rbp, %r12
	movq	%rbp, %rsi
	jle	.L62
	leaq	-1(%rbp), %r8
	jmp	.L56
.L62:
	cmpq	%r13, %r14
	jle	.L57
	movq	8(%rsp), %rax
	movq	%r13, %rsi
	leaq	-1(%r13), %r8
	movq	(%rax), %r10
	jmp	.L49
.L57:
	cmpq	%r15, 16(%rsp)
	jle	.L50
	movq	104(%rsp), %rax
	movq	%r15, %rsi
	leaq	-1(%r15), %r8
	movq	24(%rsp), %r15
	movq	(%rax), %r10
	jmp	.L42
.L50:
	movq	24(%rsp), %r9
	cmpq	%r9, 96(%rsp)
	jle	.L83
	movq	160(%rsp), %rax
	leaq	-1(%r9), %r11
	movq	(%rax), %r10
	movq	96(%rsp), %rax
	jmp	.L35
.L83:
	movq	88(%rsp), %r8
	movq	%rbx, %r9
.L43:
	cmpq	%r8, 80(%rsp)
	jle	.L36
	movq	152(%rsp), %rax
	leaq	-1(%r8), %r11
	movq	72(%rsp), %rsi
	movq	(%rax), %r10
	jmp	.L28
.L36:
	movq	72(%rsp), %r8
	cmpq	%r8, 64(%rsp)
	jle	.L29
	movq	144(%rsp), %rax
	leaq	-1(%r8), %r11
	movq	56(%rsp), %rsi
	movq	(%rax), %r10
	jmp	.L21
.L96:
	movq	%rsi, %r8
	jmp	.L43
.L29:
	movq	56(%rsp), %r8
	cmpq	%r8, 48(%rsp)
	jle	.L22
	movq	136(%rsp), %rax
	leaq	-1(%r8), %r11
	movq	40(%rsp), %rsi
	movq	(%rax), %r10
	jmp	.L14
.L22:
	movq	40(%rsp), %r8
	cmpq	%r8, 120(%rsp)
	jle	.L15
	movq	128(%rsp), %rax
	leaq	-1(%r8), %r11
	movq	(%rax), %r10
	jmp	.L7
	.cfi_endproc
.LFE8:
	.size	quick_sort, .-quick_sort
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB9:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rax
# 0 "" 2
#NO_APP
	movq	%rax, %rbx
	andl	$2, %eax
	andl	$1, %ebx
	movq	%rax, %rcx
#APP
# 6 "x86prime_lib.h" 1
	in (0),%r15
# 0 "" 2
#NO_APP
	leaq	allocator_base(%rip), %rax
	leaq	0(,%r15,8), %r13
	testq	%r15, %r15
	leaq	0(%r13,%rax), %r12
	jle	.L101
	.p2align 4,,10
	.p2align 3
.L102:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rax, %r12
	jne	.L102
	addq	%r12, %r13
	testq	%rcx, %rcx
	jne	.L132
	movq	%r13, cur_allocator(%rip)
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L106:
#APP
# 12 "x86prime_lib.h" 1
	in (1),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L106
.L115:
	leaq	-1(%r15), %r14
	testq	%r14, %r14
	jle	.L107
	xorl	%esi, %esi
.L112:
	leaq	(%r14,%rsi), %rax
	leaq	-1(%rsi), %r9
	movq	%r15, %rbp
	sarq	%rax
	movq	(%r12,%rax,8), %r8
	.p2align 4,,10
	.p2align 3
.L108:
	addq	$1, %r9
	movq	(%r12,%r9,8), %rax
	cmpq	%rax, %r8
	jg	.L108
	leaq	-1(%rbp), %rdx
	leaq	(%r12,%rdx,8), %rcx
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L120:
	movq	%rdx, %rbp
	subq	$1, %rdx
.L110:
	movq	%rcx, %r10
	subq	$8, %rcx
	movq	8(%rcx), %rdi
	cmpq	%rdi, %r8
	jl	.L120
	cmpq	%rdx, %r9
	jge	.L111
	movq	%rdi, (%r12,%r9,8)
	movq	%rdx, %rbp
	movq	%rax, (%r10)
	jmp	.L108
.L132:
	movq	%r13, cur_allocator(%rip)
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L105:
#APP
# 6 "x86prime_lib.h" 1
	in (0),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L105
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L111:
	movq	%r12, %rdi
	call	quick_sort
	cmpq	%rbp, %r14
	movq	%rbp, %rsi
	jg	.L112
.L107:
	testq	%rbx, %rbx
	je	.L100
	testq	%r15, %r15
	jle	.L100
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L114:
	movq	(%rax), %rdx
#APP
# 17 "x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L114
.L100:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
.L101:
	.cfi_restore_state
	addq	%r12, %r13
	movq	%r13, cur_allocator(%rip)
	jmp	.L115
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
