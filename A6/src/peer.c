#include <stdio.h>
#include <assert.h>
#include "peer.h"
#include "peer_login.c"
#include "peer_lookup.c"
#include "peer_logout.c"
#include "peer_exit.c"
#include "peer_input.c"

int main() {

    int logged_in = 0; // 1 is yes. 0 is no.
    size_t bufsize = 64;
    char *input_buf = (char*)calloc(bufsize, sizeof(char*));    
    const char delim[3] = "\n ";
    char *token[5];   
    
    printf("PEER CLIENT INITIATED \n");
    
    while(1){

        // get standard in
        getline(&input_buf, &bufsize, stdin);
        // tokenize
        token[0] = strtok(input_buf, delim);
        for(int i = 1;i<5;i++){
            token[i] = strtok(NULL, delim);
        }
            
        if(strcmp(token[0], "/login") == 0){
            logged_in = login(token[1],token[2],token[3],token[4]);
        } else if(strcmp(token[0], "/lookup") == 0){
            if(logged_in){
                lookup(token[1]);
            } else {
                printf("You are not logged in!\n");
            }            
        } else if(strcmp(token[0], "/logout") == 0){
            if(logged_in){
                logout();
            } else {
                printf("You are not logged in!\n");
                
            }
        } else if(strcmp(token[0], "/exit") == 0){
            exit(0);
            
        } else{  
            printf("Do not compute! Valid commands: \n/login <user> <password> <IP> <path> \n/lookup <user> \n/logout \n/exit \n");
        }       
    } 
    return 0;
}

