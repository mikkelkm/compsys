#include "csapp.h" //You can remove this if you do not wish to use the helper functions

// init db
struct user* db = NULL;

struct user {

    char *nick;
    char *password;
};

int interpreter(char *buf){
  char input[64];
  char nick[32];
  char pass[32];
  char ip[32];
  char port[32];

  int temp = 0;
  int t = 0;

  sscanf(handler, "%s", input);
  if(strcmp (input, "/login\n")==0){
    //handle login kald
    return 0;
  }
  if(strcmp (input, "/lookup\n")==0){
    //handle lookup kald
    return 0;
  }
  if(strcmp (input, "/logout\n")==0){
    //handle logout kald
    return 0;
  }
  if(strcmp (input, "/exit\n")==0){
    //handle exit kald
    exit(0);
  }
  else{
    //return en error
    return 1;
  }
}


void handler(int connfd){
  /*Gør noget afhængigt af output fra intepreter
  Fx:
  flag = intepreter(input);

  if (flag == 1){
    *log brugeren ind*
  }
  if (flag == 2){
    *log brugeren ud*
  }
  if (flag == -1){
    *exit program*
  }

  */
}



//echo routine
void echo(int connfd)
{
    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    Rio_readinitb(&rio, connfd);
    while((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {
	     printf("server received %d bytes\n", (int)n);
	     Rio_writen(connfd, buf, n);
    }
}

//Thread routine
void *thread(void *vargp)
{
  int connfd = *((int *)vargp);
  Pthread_detach(pthread_self()); 
  Free(vargp);
  echo(connfd);
  Close(connfd);
  return NULL;
}

/*
struct user* init_db(){
    struct user* db =  malloc(10 * sizeof(struct user));

    // three users
    struct user one;
    one.nick = "Adam";
    one.password = "mada1";
    struct user two;
    two.nick = "Bro";
    two.password = "orb2";
    struct user three;
    three.nick = "Chip";
    three.password = "pihc3";

    db[0] = one;
    db[1] = two;
    db[2] = three;

    return db;
}

void doit(int fd)
{
    int is_static;
    struct stat sbuf;
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
    char filename[MAXLINE], cgiargs[MAXLINE];
    rio_t rio;

    //Read request line and headers
    Rio_readinitb(&rio, fd);
    Rio_readlineb(&rio, buf, MAXLINE);                   //line:netp:doit:readrequest
    sscanf(buf, "%s %s %s", method, uri, version);       //line:netp:doit:parserequest
    sprintf(buf, "Server users are %s %s %s\r\n", db[0].nick, db[1].nick, db[2].nick);
    Rio_writen(fd, buf, strlen(buf));

    if (strcasecmp(method, "GET")) {                     //line:netp:doit:beginrequesterr
        //clienterror(fd, method, "501", "Not Implemented",      "Tiny does not implement this method");
        return;
    }                                                    //line:netp:doit:endrequesterr
    //read_requesthdrs(&rio);
}
*/
