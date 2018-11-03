#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>


int main() {
    int *s[2];
    *s[0] = 1;
    *s[1] = 2;
    
    printf("Test out: %d \n", *s[0]);
    
    return *s[1];  
}
