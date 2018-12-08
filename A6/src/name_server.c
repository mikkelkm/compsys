#include <stdio.h>
#include "name_server.h"

void echo(int connfd);

#define ARGNUM 1 // TODO: Put the number of arguments you want the
                 // program to take

// main fn aquired from http://csapp.cs.cmu.edu/2e/ics2/code/netp/tiny/tiny.c

void echo(int connfd);


int main(int argc, char **argv){


    int listenfd, connfd, port, clientlen;
    struct sockaddr_in clientaddr;

    /* Check command line args */
    if (argc != 2) {
	fprintf(stderr, "usage: %s <port>\n", argv[0]);
	exit(1);
    }
    //port = atoi(argv[1]);

    // init db
    db = init_db();

    listenfd = Open_listenfd(argv[1]);

    printf("Listen fd is %d\n",listenfd);
    
    while (1) {
	clientlen = sizeof(clientaddr);
	connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
        printf("Connection fd is %d\n", connfd);

        doit(connfd);                                             
        Close(connfd);                                            
    }
}






