#include "csapp.h" //You can remove this if you do not wish to use the helper functions

struct user {
    
    char *nick;
    char *password;
};       

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
  
    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    Rio_readlineb(&rio, buf, MAXLINE);                   //line:netp:doit:readrequest
    sscanf(buf, "%s %s %s", method, uri, version);       //line:netp:doit:parserequest
    if (strcasecmp(method, "GET")) {                     //line:netp:doit:beginrequesterr
        //clienterror(fd, method, "501", "Not Implemented",      "Tiny does not implement this method");
        return;
    }                                                    //line:netp:doit:endrequesterr
    read_requesthdrs(&rio);                  
}
