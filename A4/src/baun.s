	.text
	.cstring
lC0:
	.ascii "Test out: %d\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.globl _main
_main:
LFB5:
	subq	$8, %rsp
LCFI0:
	movl	$0, %eax
	movl	$9, (%rax)
	movl	$9, %esi
	leaq	lC0(%rip), %rdi
	call	_printf
	movl	$8, %eax
	addq	$8, %rsp
LCFI1:
	ret
LFE5:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB5-.
	.set L$set$2,LFE5-LFB5
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB5
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE1:
	.subsections_via_symbols
