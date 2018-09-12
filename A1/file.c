#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings
#include <errno.h> // errors


	// create enum class with file types
	enum file_type {
	  DATA,
	  EMPTY,
	  ASCII,
	  UTF-8,
	  Little_UTF_16,
	  Big_UTF_16	  
	};

void detect_and_print_file_type(FILE *fp){

	// string output to assist enum class
	const char * const FILE_TYPE_STRINGS[] = {
	  "data",
	  "empty",
	  "ASCII text",
	  "UTF-8",
	  "Little-endian UTF-16 Unicode text",
	  "Big-endian UTF-16 Unicode text"
	};

	// set default file type
	enum file_type tp = ASCII;


  

  	}
  


int main(int argc, char* argv[]){

	// create file object
	FILE *fp;

	// create char for chars in file
	int c = 0;

	// open files with arguments from input
	for(int i = 1;i < argc;i++){
	  fp = fopen(argv[i], "rb");

	  // can we open all file?
	  if (!fp) {
	   printf("Input read error!\n");
	   return EXIT_FAILURE;
	}
	  
	}
	


	 else {
		// move pointer to end of file and get value
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
		// print result of data file analysis
		printf("%s: %s\n", argv[1],  FILE_TYPE_STRINGS[tp]);

		// close file
   		fclose(fp);
	}
return EXIT_SUCCESS;
}
