#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings
#include <errno.h> // errors


	// create enum class with file types and string output
	enum file_type {
	  DATA,
	  EMPTY,
	  ASCII,
	};

int main(int argc, char* argv[]){

	// we only accept exactly one argument
	if (argc!=2) {return EXIT_FAILURE;}

	const char * const FILE_TYPE_STRINGS[] = {
	  "data",
	  "empty",
	  "ASCII text",
	};

	// set default file type
	enum file_type tp;
	tp = ASCII;

	// create file object
	FILE *fp;

	// create char for chars in file
	int c = 0;

	// open file with first argument from input
	fp = fopen(argv[1], "rb");

	// can we open file?
	if (!fp) {
		printf("Input read error!\n");
		return EXIT_FAILURE;
	} else {
		// move pointer to end of file and get value
		fseek(fp, 0, SEEK_END);
    		int len_file = ftell(fp);

		// EOF < 1 then the file is empty
		if(len_file<1){
		  tp = EMPTY;
		}

		// move pointer to start of file
		fseek(fp, 0, SEEK_SET);

		// for loop to check chars in file
		for(int i = 1;i<len_file;i++){

		  // use fscanf(1) or fread(1)?
		  //fscanf(fp, "%lc", &c);

		  fread(&c, sizeof(char),1,fp);

			// test print!
      //printf("hej: %ld \n",ftell(fp));
			//printf("%d = %c\n", c, c);
      //printf(" %lc = %d = %c\n", c, c, c);

			// test if file data differs from ASCII
			if(c<1 || c>127){
			  tp = DATA;
			}
		}
		// print result of data file analysis
		printf("%s: %s\n", argv[1],  FILE_TYPE_STRINGS[tp]);

		// close file
   		fclose(fp);
	}
return EXIT_SUCCESS;
}

