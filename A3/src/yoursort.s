	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_your_sort              ## -- Begin function your_sort
	.p2align	4, 0x90
_your_sort:                             ## @your_sort
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_run                    ## -- Begin function run
	.p2align	4, 0x90
_run:                                   ## @run
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	callq	_init_allocator
	callq	_read_long
	movq	%rax, %r14
	callq	_read_long
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	_get_random_array
	movq	%rbx, %rdi
	testb	$2, %r14b
	jne	LBB1_1
## %bb.2:
	callq	_get_random_array
	jmp	LBB1_3
LBB1_1:
	callq	_read_array
LBB1_3:
	movq	%rax, %r15
	testb	$1, %r14b
	je	LBB1_5
## %bb.4:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_print_array
LBB1_5:
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.comm	_cur_allocator,8,3      ## @cur_allocator
	.comm	_allocator_base,8,3     ## @allocator_base

.subsections_via_symbols
