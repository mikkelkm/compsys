#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){
  FILE *fp;
  char filename[] = "";
  char *buffer = 0;
  int sz;

  printf("Enter the filename to open \n");
  scanf("%s", filename);
  fp = fopen(filename, "r");

  fseek(fp, 0, SEEK_END);
  sz = ftell(fp);
  fseek(fp, 0, SEEK_SET);
  buffer = malloc(sz);

  fread(buffer, 1, sz, fp);
  printf("%s\n", buffer);
  fclose(fp);

  return 0;
}
