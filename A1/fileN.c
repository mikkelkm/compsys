#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings
#include <errno.h> // errors

#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>

/* 

   TODO: 
   - NOACCES bliver ikke fanget/brugt



*/

// create enum class with file types
enum file_type {
  NOFILE,
  NOACCESS,
  DATA,
  EMPTY,
  ASCII,
  ISO,
  UTF_8,
  LITTLE_16,
  BIG_16,
};

int max_length;

void output_type(char *path, enum file_type tp){

  const char * const FILE_TYPE_STRINGS[] = {
    "cannot determine (No such file or directory)",
    "cannot determine (Permission denied)",
    "data",
    "empty",
    "ASCII text",
    "ISO-8859 text",
    "UTF-8",
    "Little-endian UTF-16 Unicode text",
    "Big-endian UTF-16 Unicode text"
  };
  fprintf(stdout, "%s:%*s\t%s\n", path, (int)(max_length-strlen(path)), " ", FILE_TYPE_STRINGS[tp]);
}
  
  
int detect_and_print_file_type(char *path){

  // create int to hold chars in file
  int c = 0;

  // set default file type
  enum file_type tp = ASCII;

  // create file object
  FILE *fp;
  fp = fopen(path, "rb");


  // NO FILE
  if (!fp) {
    output_type(path,NOFILE);
    return EXIT_SUCCESS;
  }

  // flags to help detect file types
  int c1 = fgetc(fp);
  int c2 = fgetc(fp);
  int b1 = fgetc(fp);
  int b2 = fgetc(fp);
  int b3 = fgetc(fp);
  int b4 = fgetc(fp);

  int asc = 1;
  int iso = 1;
  int lit = 0;
  int big = 0;
  int utf = 0;
  int dat = 0;
  int zeroFlag = 0;
	
  // can we open file?
 
  
  // get length of file
  fseek(fp, 0, SEEK_END);
  int len_file = ftell(fp);

  // EOF < 1 then the file is empty
  if(len_file==0){
    output_type(path,EMPTY);
    return EXIT_SUCCESS;
  }

  // move pointer to start of file
  fseek(fp, 0, SEEK_SET);

  // for loop to check chars in file
  for(int i = 1;i<len_file;i++){
    fread(&c,sizeof(char),1,fp);

    // test if file data differs from the ASCII characters mentioned in assignment description
    if((zeroFlag && c >= 128 && c <= 159) || (c > 0 && c < 255)){
      //tp = ISO ;
      iso = 0;
      break;
    }

    if(( c > 0 && c < 127) || c > 127){
      //tp= ASCII;
      asc = 0;
      break;
    }
    if(c == 0){
      zeroFlag = 1;
    }

    if(c1 == 255 && c2 == 254){
      //tp = LITTLE_16;
      lit = 1;
      break;
    }
    if(c1 == 254 && c2 == 255){
      //tp = BIG_16;
      big = 1;
      break;
    }
    if((b1 >> 5) == 0x6){
      if((b2 >> 6) == 0x2){
	//tp = UTF_8;
	utf = 1;
	break;
      }
    }
    if((b1 >> 4) == 0xE){
      if(((b2 >> 6) == 0x2) && ((b3 >> 6) == 0x2)){
	//tp = UTF_8;
	utf = 1;
	break;
      }
    }
    if((b1 >> 3) == 0x1E){
      if(((b2 >> 6) == 0x2) && ((b3 >> 6) == 0x2) && ((b4 >> 6) == 0x2)){
	//tp = UTF_8;
	utf = 1;
	break;
      }
    }
    if(!( (c>=7 && c<=13) || (c==27) || (zeroFlag && c>=32 && c<=126) )){
      //tp = DATA;
      dat =1;
      break;
    }
    
  }



  
  // close file
  fclose(fp);

  // print result of file analysis
  //if(size == 0){
  //tp = EMPTY;
  //printf("%s%s this file is empty\n", argv[i],":");
  // }
  if(asc == 1 && big == 0 && lit == 0){
    tp = ASCII;
    //printf("%s%-8s ASCII text\n", path,":");
  }
  else if(iso == 1 && asc == 0 && utf == 0){
    tp = ISO;
    //printf("%s%-10s ISO-8859 text\n", path,":");
  }
  else if(lit == 1){
    tp = LITTLE_16;
    //printf("%s%-1s Little-endian UTF-16 Unicode text\n", path,":");
  }
  else if(big == 1){
    tp = BIG_16;    
    //printf("%s%-1s Big-endian UTF-16 Unicode text\n", path,":");
  }
  else if(utf == 1 && asc == 0){
    tp = UTF_8;
    //printf("%s%-3s UTF-8 Unicode text\n", path,":");
  }
  else if(dat == 1){
    tp = DATA;
    //printf("%s%-9s data\n", path,":");
  }
  
  //output result of analysis
  output_type(path,tp);
  
  return EXIT_SUCCESS;
}


int main(int argc, char *argv[]){

  // set max length of input path
  max_length = 0;
  for(int i = 1;i < argc;i++){
    max_length = ((int)strlen(argv[i]) > max_length) ? strlen(argv[i]): max_length;   
  }
  
  // check each argument/path
  for(int i = 1;i < argc;i++){
    // detect file type of path i
    detect_and_print_file_type(argv[i]);
  }
  return EXIT_SUCCESS;
}
