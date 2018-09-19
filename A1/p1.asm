p1:
  movq %rdi, %rax
  negq %rdi
  testq %rdi, %rdi
  cmovs %rdi, %rax
  ret
