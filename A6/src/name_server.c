#include <stdio.h>
#include "name_server.h"

#define ARGNUM 1 // TODO: Put the number of arguments you want the
// program to take

int main(int argc, char **argv){

    int listenfd, *connfdp;
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    pthread_t tid;

    if (argc != 2) {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }
    listenfd = Open_listenfd(argv[1]);

    while (1) {
        int new_socket = accept(s,(struct sockaddr *)&client,&n);
		    printf("SERVER : Got a new connection from -- %s %d\n\n", inet_ntoa(client.sin_addr), ntohs(client.sin_port));
        clientlen=sizeof(struct sockaddr_storage);
        connfdp = Malloc(sizeof(int));
        *connfdp = Accept(listenfd, (SA *) &clientaddr, &clientlen);
        Pthread_create(&tid, NULL, thread, connfdp);
        Getnameinfo((SA *) &clientaddr, clientlen, client_hostname, MAXLINE,
                    client_port, MAXLINE, 0);

        printf("Connected to (%s, %s) via thread %d\n",
               client_hostname, client_port, (int) tid);
    }
}
