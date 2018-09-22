#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings
#include <errno.h> // errors

#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>


#define UTF8_2B(c) (((c) >> 5) == 0x6)

#define UTF8_3B(c) (((c) >> 4) == 0xE)

#define UTF8_4B(c) (((c) >> 3) == 0x1E)

#define UTF8_CONT(c) (((c) >> 6) == 0x2)



// create enum class with file types
enum file_type {
  DATA,
  EMPTY,
  ASCII,
  ISO,
  UTF_8,
  LITTLE_16,
  BIG_16,
};

int max_length;

// acii hjælpefunktion, ser om karakterer er inde for ascii-karaktersættet
int is_ascii(int c){
  if((c < 7 || (c > 13 && c < 27) || (c > 27 && c < 32) || c > 126)){
    return 0;
  }
  else{
    return 1;
  }
}

// iso hjælpefunktion, ser om karakterer er inde for iso-8859-1-karaktersættet
int is_iso(int c){
  if((c < 32 && c > 13) || (c < 9 && c > 10)  || (c > 126 && c < 160) || c > 255){
    return 0;
  }
  else{
    return 1;
  }
}

// little-endian hjælpefunktion, kigger efter "magic numbers"
int is_lit(int c1, int c2){
  if(c1 == 255 && c2 == 254){
    return 1;
  }
  else{
    return 0;
  }
}

// big-endian hjælpefunktion, kigger efter "magic numbers"
int is_big(int c1, int c2){
  if(c1 == 254 && c2 == 255){
    return 1;
  }
  else{
    return 0;
  }
}


void output_type(char *path, enum file_type tp){

  const char * const FILE_TYPE_STRINGS[] = {
    "data",
    "empty",
    "ASCII text",
    "ISO-8859 text",
    "UTF-8 Unicode text",
    "Little-endian UTF-16 Unicode text",
    "Big-endian UTF-16 Unicode text"
  };
  fprintf(stdout, "%s:%*s%s\n", path, (int)(max_length-strlen(path)), " ", FILE_TYPE_STRINGS[tp]);
}

int print_error(char *path, int errnum) {
  return fprintf(stdout, "%s: cannot open (%s)\n", path, strerror(errnum));
}


int detect_and_print_file_type(char *path){

  // create variables
  int c = '0';
  int c_place = 0;

  // set default file type
  enum file_type tp = DATA;

  // create file objects
  FILE *fp;
  fp = fopen(path, "rb+");

  // File error
  if (!fp) {
    print_error(path, errno);
    return EXIT_SUCCESS;
  }

  // get length of file
  fseek(fp, 0, SEEK_END);
  int len_file = ftell(fp);

  // EOF < 1 then the file is empty
  if(len_file==0){
    output_type(path,EMPTY);
    // close file
    fclose(fp);
    return EXIT_SUCCESS;
  }

  // move pointer to start of file
  fseek(fp, 0, SEEK_SET);

  // flags to help detect file types
  int asc = 1;
  int iso = 1;
  int lit = 0;
  int big = 0;
  int utf = 0;
  int dat = 0;

  //saving first 2 bytes for little and big-endian check
  int c1 = fgetc(fp);
  int c2 = fgetc(fp);

  // move pointer to start of file (again)
  fseek(fp, 0, SEEK_SET);

  for(int i = 0;i<len_file;i++){

    c = fgetc(fp);
    c_place = ftell(fp);

    // saving first 4 bytes for utf8 check
    int b1 = fgetc(fp);
    int b2 = fgetc(fp);
    int b3 = fgetc(fp);
    int b4 = fgetc(fp);

    // move pointer back to c
    fseek(fp, c_place, SEEK_SET);

    // put ISO flag
    if (is_iso(c) != 1){
      iso = 0;
    }

    // put ASCII flag
    if (is_ascii(c) != 1){
      asc = 0;
    }

    // put little-endian flag
    lit = is_lit(c1, c2);

    // put big-endian flag
    big = is_big(c1, c2);

    // tjek for 2-byte utf8
    if(UTF8_2B(b1) && UTF8_CONT(b2)){
      utf = 1;
    }

    // check for 3-byte utf8
    if(UTF8_3B(b1) && UTF8_CONT(b2) && UTF8_CONT(b3)){
      utf = 1;
    }

    // check for 4-byte utf8
    if(UTF8_4B(b1) && UTF8_CONT(b2) && UTF8_CONT(b3) && UTF8_CONT(b4)){
      utf = 1;
    }

    else{
      dat = 1;
    }
  }

  if(asc == 1 && big == 0 && lit == 0){
    tp = ASCII;
  }
  else if(lit == 1){
    tp = LITTLE_16;
  }
  else if(big == 1){
    tp = BIG_16;
  }
  else if(iso == 1 && asc == 0 && utf == 0){
    tp = ISO;
  }
  else if(utf == 1){
    tp = UTF_8;
  }
  else if(dat == 1)
  {
    tp = DATA;
  }

  //output result of analysis
  output_type(path,tp);
  // close file
  fclose(fp);
  return EXIT_SUCCESS;
}


int main(int argc, char *argv[]){

  // program only works with one or more arguments
  if (argc < 2){
    fprintf(stderr, "Usage: file path\n");
    return EXIT_FAILURE;
  }
  // set max length of input path
  max_length = 0;
  for(int i = 1;i < argc;i++){
    max_length = ((int)strlen(argv[i]) > max_length) ? (int)strlen(argv[i]) : max_length;
  }

  // check each argument/path
  for(int i = 1;i < argc;i++){
    // detect file type of path i
    detect_and_print_file_type(argv[i]);
  }
  return EXIT_SUCCESS;
}
