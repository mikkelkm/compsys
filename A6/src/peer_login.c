#include "csapp.h"

int login(char *nick, char *password, char *host, char *port){

    char *buf[MAXLINE];
    rio_t rio;

    printf("Trying to login at %s %s with %s %s \n",host,port,nick,password);
    int clientfd = open_clientfd(host,port);

    Rio_readinitb(&rio, clientfd);

    while (Fgets(buf, MAXLINE, stdin) != NULL) {
	Rio_writen(clientfd, buf, strlen(buf));
	Rio_readlineb(&rio, buf, MAXLINE);
	Fputs(buf, stdout);
    }
    Close(clientfd);
    
    return 1;
}


