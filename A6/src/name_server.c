#include <stdio.h>
#include "name_server.h"

#define ARGNUM 0 // TODO: Put the number of arguments you want the
                 // program to take

int main(int argc, char**argv) {
    if (argc != ARGNUM + 1) {
        printf("%s expects %d arguments.\n", (argv[0]+2), ARGNUM);
        return(0);
    }
    //TODO: Implement
    return 0;
}
