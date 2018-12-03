#include <stdio.h>
#include <assert.h>
#include "peer.h"

#define ARGNUM 2 // TODO: Put the number of arguments you want the
                 // program to take
                 // CB: Command line arguments are used to provide
                 // the peer client with the IP address and port of the name server.name of the name server?

char *IP_nameserver = "192.168.1.42";    // IP address of name server
char *port_nameserver = "3456";          // Port of name server


int main(int argc, char**argv) {
    
    if (argc != ARGNUM + 1) {
        printf("%s expects %d arguments.\n", (argv[0]+2), ARGNUM);
        return(0);
    }
    
    char *IP = argv[1]; // IP address of name server?
    char *port = argv[2];     // Port of name server?
       
    if(strcmp(IP, IP_nameserver)!=0){
        printf("Unknown host \n");
        return 1;
    }
    else if(strcmp(port, port_nameserver)!=0){
        printf("Unknown port \n");
        return 1;
    }

    // create connection to nameserver
    int clientfd = open_clientfd(IP,port);
    assert(clientfd > 0);
    
    
    printf("/login ");
    
    
// CB:  The syntax for the command is :
//      /login <nick> <password> <IP> <Port>
    
    
    //TODO: Implement
    return 0;
}
