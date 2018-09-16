#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]){
  int c;
  int i = 0;
  if (argc < 2){
    fprintf(stderr, "Giv mig en fil!\n");
    exit(EXIT_FAILURE);
  }
  for(i=1; i < argc; i++){
    int asc = 1;
    int iso = 1;
    int lit = 0;
    int big = 0;
    int utf = 0;
    int dat = 0;
    int zeroFlag = 0;
    //int size = 1;

    FILE *f1 = fopen(argv[i], "r");
    
    if (f1 == NULL){	  
      fprintf(stderr, "%s%s cannot open %s (no such file or directory) \n", argv[i],":", argv[i]);
      exit(EXIT_FAILURE);
    }

    int c1 = fgetc(f1);
    int c2 = fgetc(f1);
    
    // LOOOOOP
    // look at chars in file
    while((c=fgetc(f1)) != EOF){
        int b1 = fgetc(f1);
        int b2 = fgetc(f1);
        int b3 = fgetc(f1);
        int b4 = fgetc(f1);
	
        if(((c >= 128) && (c <= 159)) || (zeroFlag && c > 0 && c < 255)){
          iso = 0;
        }
        if((zeroFlag && c > 0 && c < 127) || c > 127){
          asc = 0;
        }
        if(c == 0){
          zeroFlag = 1;
        }
        if(c1 == 255 && c2 == 254){
          lit = 1;
        }
        if(c1 == 254 && c2 == 255){
          big = 1;
        }
        if((b1 >> 5) == 0x6){
          if((b2 >> 6) == 0x2){
            utf = 1;
          }
        }
        if((b1 >> 4) == 0xE){
          if(((b2 >> 6) == 0x2) && ((b3 >> 6) == 0x2))
            utf = 1;
        }
        if((b1 >> 3) == 0x1E){
          if(((b2 >> 6) == 0x2) && ((b3 >> 6) == 0x2) && ((b4 >> 6) == 0x2))
            utf = 1;
        }
        if(asc == 0 && iso == 0 && lit == 0 && big == 0 && utf == 0){
          dat = 1;
        }
    }


    //OK
    
    //if(size == 0){
    //printf("%s%s this file is empty\n", argv[i],":");
    // }
    if(asc == 1 && big == 0 && lit == 0){
      printf("%s%-8s ASCII text\n", argv[i],":");
    }
    else if(iso == 1 && asc == 0 && utf == 0){
      printf("%s%-10s ISO-8859 text\n", argv[i],":");
    }
    else if(lit == 1){
      printf("%s%-1s Little-endian UTF-16 Unicode text\n", argv[i],":");
    }
    else if(big == 1){
      printf("%s%-1s Big-endian UTF-16 Unicode text\n", argv[i],":");
    }
    else if(utf == 1 && asc == 0){
      printf("%s%-3s UTF-8 Unicode text\n", argv[i],":");
    }
    else {
      printf("%s%-9s data\n", argv[i],":");
    }
  }
}
