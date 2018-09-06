#include <stdio.h> // fprintf, stdout, stderr.
#include <stdlib.h> // exit, EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strerror.
#include <errno.h> // errno.
int main(int argc, char const *argv[]){
  char file_type[256];

  FILE *file = fopen(argv[1], "r");
  int c = fgetc(file);

  if (argc != 2){
    fprintf(stderr, "Usage: file path\n");
    return EXIT_FAILURE;
  }
  else{
    if (file == NULL){
      fprintf(stdout, "%s: cannot determine (No such file or directory)\n", argv[1]);
      return EXIT_SUCCESS;
    }

    while(c != EOF){
      printf("%d\n", c);
      if(c > 0 && c < 127){
        strcpy(file_type, "ASCII text");
        return EXIT_SUCCESS;
      }
      else{
        strcpy(file_type, "data");
        return EXIT_SUCCESS;
      }
    }
    fprintf(stdout, "%s: %s\n", argv[1], file_type);
    return EXIT_SUCCESS;
  }

  return 0;
}
