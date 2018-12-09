#include <stdio.h>
#include "name_server.h"

void echo(int connfd);

#define ARGNUM 1 // TODO: Put the number of arguments you want the
// program to take

void echo(int connfd);
void *thread(void *vargp);

//echo routine
void echo(int connfd)
{
    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    Rio_readinitb(&rio, connfd);
    while((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) { //line:netp:echo:eof
	printf("server received %d bytes\n", (int)n);
	Rio_writen(connfd, buf, n);
    }
}

//Thread routine
void *thread(void *vargp)
{
  int connfd = *((int *)vargp);
  Pthread_detach(pthread_self()); //line:conc:echoservert:detach
  Free(vargp);                    //line:conc:echoservert:free
  echo(connfd);
  Close(connfd);
  return NULL;
}

int main(int argc, char **argv)
{
  int listenfd, *connfdp;
  socklen_t clientlen;
  struct sockaddr_storage clientaddr;
  pthread_t tid;
  char client_hostname[MAXLINE], client_port[MAXLINE];

  if (argc != 2) {
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(0);
  }
  listenfd = Open_listenfd(argv[1]);

  while (1) {
    clientlen=sizeof(struct sockaddr_storage);
    connfdp = Malloc(sizeof(int)); //line:conc:echoservert:beginmalloc
    *connfdp = Accept(listenfd, (SA *) &clientaddr, &clientlen); //line:conc:echoservert:endmalloc
    Pthread_create(&tid, NULL, thread, connfdp);
    Getnameinfo((SA *) &clientaddr, clientlen, client_hostname, MAXLINE,
    client_port, MAXLINE, 0);
    printf("Connected to (%s, %s) via thread %d\n",
    client_hostname, client_port, (int) tid);
  }
}
