#include <stdio.h>

int main(int argc, char const *argv[]){

  if (argv[1][0] == 'A' || argv[1][0] == 'a'){
    printf("No beginning A's are allowed\n");
  }
  else{
    printf("%s\n", argv[1]);
  }
  return argc;
}
