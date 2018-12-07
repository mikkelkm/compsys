#include <stdio.h>
#include "name_server.h"


#define ARGNUM 1 // TODO: Put the number of arguments you want the
                 // program to take

// main fn aquired from http://csapp.cs.cmu.edu/2e/ics2/code/netp/tiny/tiny.c

int main(int argc, char **argv){

    // init db
    struct user* db = init_db();
    
    int listenfd, connfd, port, clientlen;
    struct sockaddr_in clientaddr;     

    /* Check command line args */
    if (argc != 2) {
	fprintf(stderr, "usage: %s <port>\n", argv[0]);
	exit(1);
    }
    port = atoi(argv[1]);
    
    listenfd = Open_listenfd(port);
    
    while (1) {
	clientlen = sizeof(clientaddr);
	connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen); 
	doit(connfd);                                             
	Close(connfd);                                            
    }
    return 0;
}




