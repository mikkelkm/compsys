#include "csapp.h" //You can remove this if you do not wish to use the helper functions

void lookup(int fd, char* nick, size_t n);
struct user* init_db();
struct user* db = NULL;


struct user {

    char *nick;
    char *password;
};

// handles HTTP requests
void handler(int connfd){
    
    size_t n;
    char buf[MAXLINE];
    char tok_buf[MAXLINE];
    rio_t rio;
    int flag = 0;
    char request[32];
    const char delim[3] = "\n ";
    char *token[5];   
    
    Rio_readinitb(&rio, connfd);

    while((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {
        printf("server received %d bytes\n", (int)n);
        
        strcpy(tok_buf,buf);

        // tokenize
        token[0] = strtok(tok_buf, delim);
        for(int i = 1;i<5;i++){
            token[i] = strtok(NULL, delim); 
        }

        strcpy(request,token[0]);
        
        printf("REQUEST received is %s\n", request);

        // ECHO
        Rio_writen(connfd, buf, n);

        if(strcmp (request, "/login")==0){
            printf("LOGGING IN\n");
            
            //handle login kald
        }
        if(strcmp (request, "/lookup")==0){
            printf("LOOKING UP\n");
            if(flag==1){
                lookup(connfd, token[1], n);
            }
            else {
                Rio_writen(connfd, "You are not logged in!", n);   
            }    
        }
        if(strcmp (request, "/logout")==0){
            printf("LOGGIN OUT\n");  
            //handle logout kald
        }
        if(strcmp (request, "/exit")==0){
            printf("EXITTING NOW\n");  
            //handle exit kald
            exit(0);
        }
        else{
            //return en error
        }
    }
}

//Thread routine
void *thread(void *vargp){
    
  int connfd = *((int *)vargp);
  Pthread_detach(pthread_self()); 
  Free(vargp);
  // init db
  db = init_db();

  //echo(connfd);
  handler(connfd);
  
  Close(connfd);
  return NULL;
}


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

void lookup(int fd, char* nick, size_t n){
    if(nick){
        Rio_writen(fd, nick, n);   
    }
    else{
            Rio_writen(fd, db[0].nick, n);   
            Rio_writen(fd, db[1].nick, n);   
            Rio_writen(fd, db[2].nick, n);   
    }
}









int interpreter(char *buf){
    char request[64];
    char nick[32];
    char pass[32];
    char ip[32];
    char port[32];
    
    int temp = 0;
    int t = 0;
    
    sscanf(buf, "%s", request);
    
    if(strcmp (request, "/login\n")==0){
        printf("SERVER receives /login request");  
        //handle login kald
        return 1;
    }
    if(strcmp (request, "/lookup\n")==0){
        //handle lookup kald
        return 2;
    }
    if(strcmp (request, "/logout\n")==0){
        //handle logout kald
        return 3;
    }
    if(strcmp (request, "/exit\n")==0){
        //handle exit kald
        exit(0);
    }
    else{
        //return en error
        return 0;
    }
    
    return 0;    
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


/*
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

    if (strcasecmp(Method, "GET")) {                     //line:netp:doit:beginrequesterr
        //clienterror(fd, method, "501", "Not Implemented",      "Tiny does not implement this method");
        return;
    }                                                    //line:netp:doit:endrequesterr
    //read_requesthdrs(&rio);
}
*/
