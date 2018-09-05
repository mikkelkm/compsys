#include <stdlib.h>
#include <stdio.h>
int main(int argc, char const *argv[]){

  (void)argv;

  if (argc != 1){
    return EXIT_SUCCESS;
  }
  else{
    fprintf(stderr, "Usage: Give exactly 1 argument for success, everything else fails\n");
  return EXIT_FAILURE;
  }
  return 0;
}
