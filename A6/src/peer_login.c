#include "csapp.h"

int login(char *nick, char *password, char *host, char *port){

    char *buf[MAXLINE];
    rio_t rio;

    printf("Trying to login at %s %s with %s %s \n",host,port,nick,password);
    int clientfd = open_clientfd(host,port);

    printf("Client fd: %d\n", clientfd);

    Rio_readinitb(&rio, clientfd);

    while(getline(&input_buf, &bufsize, stdin) != NULL){
	Rio_writen(clientfd, buf, strlen(buf));
	Rio_readlineb(&rio, buf, MAXLINE);
        Rio_writen(stdout, buf, MAXLINE);
    }  
    Close(clientfd);
    
    return 1;
}


