#include <stdio.h> // fprintf, stdout, stderr.
#include <stdlib.h> // exit, EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strerror.
#include <errno.h> // errno.
int main(int argc, char const *argv[]){
  char file_path = argv[1];
  char file_type;

  FILE *f1 = fopen(argv[1], "r");

  if (argc != 2){
    fprintf(stderr, "Usage: file path\n");
    return EXIT_FAILURE;
  }
  else{
    if (f1 == NULL){
      fprintf(stderr, "%s%s cannot open %s (no such file or directory) \n", file_path,":", file_type);
      return EXIT_FAILURE);
    }
    else{
      fprintf(stdout, "%s: %s\n", file_path, file_type);
      return EXIT_SUCCESS;
    }

  }
  return 0;
}
