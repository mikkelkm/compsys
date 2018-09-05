#include <stdio.h>  // fprintf, stdout
#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS.
#include <string.h> // strings

int main(int argc, char* argv[]){
	
	// we only accept exactly one argument
	if (argc!=2) {return EXIT_FAILURE;}

	// create file object
	FILE *fp;

	// create char array object for first line of file
	//char line[100];
	// create char array object for name of file type
	char file_type[20] = ".ASCII";
	// create char for chars in file
	char c;

	// open file with first argument from input
	fp = fopen(argv[1], "r");

	// can we open file?
	if (!fp) {
		printf("Input read error!\n");
		fclose(fp);
		return EXIT_FAILURE;
	} else {

		// get first line
		//if(fgets (line, 60, fp)!=NULL ) {
//			puts(line);
  // 		}

		// move pointer to end of file
		fseek(fp, 0, SEEK_END);
	
    		int len_file = ftell(fp); 
		if(len_file<1){
			strcpy(file_type, "EMPTY file");
		}

		// move pointer to start of file
		fseek(fp, 0, SEEK_SET);  		

		for(int i = 1;i<len_file;i++){
			fscanf(fp, "%c", &c);
			//printf("%d\n", c);

			if(c<1 || c>127){
				strcpy(file_type, ".DATA");
			}
		}

		printf("PATH: %s\n", file_type);
		// close file
   		fclose(fp);
	}	
return EXIT_SUCCESS;
}


