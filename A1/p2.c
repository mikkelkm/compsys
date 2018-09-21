#include <stdio.h>  // fprintf, stdout

/*

  p2:				Intermediate translation:

  movl $0, %ecx			ecx = 0 dvs. rcx = 0
  movl $0, %eax			eax = 0 dvs. rax = 0
  jmp L3			GOTO L3

  L4:
  addq $1, %rax			rax++

  L3:
  movq (%rsi,%rax,8), %rdx	rdx = rsi[rax] 
  testq %rdx, %rdx		IF (rdx==0)  
  je L5				  GOTO L5
  
  cmpq %rdi, %rdx		IF (rdi==rdx) 
  je L4				  GOTO L4
  
  movq %rdx, (%rsi,%rcx,8) 	rsi[rcx] = rdx   
  addq $1, %rcx			rcx++
  jmp L4			GOTO L4

  L5:
  movq $0, (%rsi,%rcx,8)        rsi[rcx] = 0
  
  subq %rcx, %rax		rax-=rcx
  ret				return rax

*/

// C program

// zero terminated array as input, e.g. a string (which is NUL terminated)
int prog(long x, char * arr) {

  int count = 0;

  // loop until you find 0
  for(int i = 0;arr[i]!= 0;i++) {

    // count number of x characters in string
    if(x == arr[i]){
      count++;
    }
  }
  return count;
}

// Example

int main(){
  char * arr = "computer systems are the new black!";
  long c = 'e'; 
  printf("The string \"%s\" holds %d %c's \n", arr, prog(c,arr), (char)c);
  return 0;
}
 
