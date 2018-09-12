#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings
#include <errno.h> // errors


	// create enum class with file types
	enum file_type {
	  NOFILE,
	  NOACCESS,
	  DATA,
	  EMPTY,
	  ASCII,
	  UTF_8,
	  LITTLE_16,
	  BIG_16,
	};

void detect_and_print_file_type(char *path){

	// string output to assist enum class
	const char * const FILE_TYPE_STRINGS[] = {
	  "cannot determine (No such file or directory)",
	  "cannot determine (Permission denied)",
	  "data",
	  "empty",
	  "ASCII text",
	  "UTF-8",
	  "Little-endian UTF-16 Unicode text",
	  "Big-endian UTF-16 Unicode text"
	};

	// create char for chars in file
	int c = 0;
	
	// set default file type
	enum file_type tp = ASCII;

	// create file object
	FILE *fp;
	fp = fopen(path, "rb");
	  
	// can we open file?
	if (!fp) {
	  tp = NOFILE;
	} else {
	  // get length of file
	  fseek(fp, 0, SEEK_END);
	  int len_file = ftell(fp);

	  // EOF < 1 then the file is empty
	  if(len_file==0){
	    tp = EMPTY;
	  }

	  // move pointer to start of file
	  fseek(fp, 0, SEEK_SET);
	  
	  // for loop to check chars in file
	  for(int i = 1;i<len_file;i++){
	    // use fscanf(1) or fread(1)?
	    //fscanf(fp, "%lc", &c);
	    fread(&c,sizeof(char),1,fp);
	    
	    // test print!
	    // printf("%d = %c\n", c, c);
	    
	    // test if file data differs from the ASCII characters mentioned in assignment description
	    if(!( (c>=7 && c<=13) || (c==27) || (c>=32 && c<=126) )){
	      tp = DATA;
	      break;
	    }
	  }
	}
	// close file
	fclose(fp);
	
	// print result of file analysis
	printf("%s: %s\n", path, FILE_TYPE_STRINGS[tp]);
}
  
int main(int argc, char *argv[]){
  
	// check each argument
	for(int i = 1;i < argc;i++){
	  // detect file type of path i
	  detect_and_print_file_type(argv[i]);
	}	
return EXIT_SUCCESS;
}
