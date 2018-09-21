#include <stdio.h>  // fprintf, stdout

/*

  p1:				Intermediate translation:

  movq %rdi, %rax		rax = rdi     
  negq %rdi			rdi = -rdi   
  testq %rdi, %rdi		if(rdi<0)     [ set SF to 1 if rdi < 0 (negative) ]
  cmovs %rdi, %rax		  rax=rdi     [ cmovs is DO if SF=1 ]
  ret				return rax

*/

// C program that returns the negated absolut value of input

long prog(long x) {
  long y = -x;
  if(y < 0) {
    return y;
  } else {
    return x;
  }   
}

// Example

int main(){
  
  for (long i = -9;i<9;i++){
    printf("%ld = %ld\n", i, prog(i));
  }
  return 1;
}

