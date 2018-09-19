p2:
  movl $0, %ecx
  movl $0, %eax
  jmp L3
L4:
  addq $1, %rax
L3:
  movq (%rsi,%rax,8), %rdx
  testq %rdx, %rdx
  je L5
  cmpq %rdi, %rdx
  je L4
  movq %rdx, (%rsi,%rcx,8)
  addq $1, %rcx
  jmp L4
L5:
  movq $0, (%rsi,%rcx,8)
  subq %rcx, %rax
  ret
