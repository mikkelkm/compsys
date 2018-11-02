	.file	"325982255326c590d2c63f2b9421eb2c.c"
	.text
	.globl	sift_down
	.type	sift_down, @function
sift_down:
.LFB8:
	.cfi_startproc
	jmp	.L2
.L6:
	leaq	(%rdx,%rdi,8), %r9
	movq	(%r9), %r8
	movq	%rax, %r10
	cmpq	(%rdx,%rax,8), %r8
	jl	.L3
	movq	%rdi, %rax
.L3:
	addq	$2, %rcx
	cmpq	%rcx, %rsi
	jl	.L4
	movq	8(%rdx,%r10,8), %r11
	cmpq	%r11, (%rdx,%rax,8)
	jge	.L4
	movq	%rcx, %rax
.L4:
	cmpq	%rax, %rdi
	je	.L1
	leaq	(%rdx,%rax,8), %rcx
	movq	(%rcx), %rdi
	movq	%rdi, (%r9)
	movq	%r8, (%rcx)
	movq	%rax, %rdi
.L2:
	leaq	(%rdi,%rdi), %rcx
	leaq	1(%rcx), %rax
	cmpq	%rsi, %rax
	jle	.L6
.L1:
	rep ret
	.cfi_endproc
.LFE8:
	.size	sift_down, .-sift_down
	.globl	heapify
	.type	heapify, @function
heapify:
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
	movq	%rdi, %rbp
	movq	%rsi, %r12
	leaq	-2(%rdi), %rbx
	sarq	%rbx
	jmp	.L9
.L10:
	leaq	-1(%rbp), %rsi
	movq	%r12, %rdx
	movq	%rbx, %rdi
	call	sift_down
	subq	$1, %rbx
.L9:
	testq	%rbx, %rbx
	jns	.L10
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9:
	.size	heapify, .-heapify
	.globl	heap_sort
	.type	heap_sort, @function
heap_sort:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	call	heapify
	subq	$1, %rbx
	jmp	.L13
.L14:
	leaq	0(%rbp,%rbx,8), %rax
	movq	(%rax), %rdx
	movq	0(%rbp), %rcx
	movq	%rcx, (%rax)
	movq	%rdx, 0(%rbp)
	subq	$1, %rbx
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movl	$0, %edi
	call	sift_down
.L13:
	testq	%rbx, %rbx
	jg	.L14
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE10:
	.size	heap_sort, .-heap_sort
	.globl	run
	.type	run, @function
run:
.LFB11:
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
	movq	%rax, %rsi
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rdi
# 0 "" 2
#NO_APP
	movq	%rdi, %rbx
	leaq	0(,%rdi,8), %rcx
	leaq	allocator_base(%rcx), %rax
	movq	%rax, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L17
.L18:
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rdx
# 0 "" 2
#NO_APP
	movq	%rdx, allocator_base(,%rax,8)
	addq	$1, %rax
.L17:
	cmpq	%rax, %rbx
	jg	.L18
	testq	%rsi, %rsi
	je	.L19
	movq	cur_allocator(%rip), %rbp
	addq	%rbp, %rcx
	movq	%rcx, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L20
.L21:
	leaq	0(%rbp,%rax,8), %rdx
#APP
# 6 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (0),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rdx)
	addq	$1, %rax
.L20:
	cmpq	%rax, %rbx
	jg	.L21
	jmp	.L22
.L19:
	movq	cur_allocator(%rip), %rbp
	addq	%rbp, %rcx
	movq	%rcx, cur_allocator(%rip)
	movl	$0, %eax
	jmp	.L23
.L24:
	leaq	0(%rbp,%rax,8), %rdx
#APP
# 12 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	in (1),%rcx
# 0 "" 2
#NO_APP
	movq	%rcx, (%rdx)
	addq	$1, %rax
.L23:
	cmpq	%rax, %rbx
	jg	.L24
.L22:
	movq	%rbp, %rsi
	call	heap_sort
	testq	%r12, %r12
	jne	.L28
	jmp	.L26
.L27:
	movq	0(%rbp,%rax,8), %rdx
#APP
# 17 "/home/pirc/public_compsys17/gcc_runs/x86prime_lib.h" 1
	out %rdx,(0)
# 0 "" 2
#NO_APP
	addq	$1, %rax
	jmp	.L25
.L28:
	movl	$0, %eax
.L25:
	cmpq	%rax, %rbx
	jg	.L27
.L26:
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	run, .-run
	.comm	allocator_base,8,8
	.comm	cur_allocator,8,8
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
