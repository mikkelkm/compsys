#include "csapp.h" //You can remove this if you do not wish to use the helper functions

#define msg_not_in "You are not logged in\n"
#define msg_in "You are already logged in\n"
#define msg_login_fail "Login failed; Please try again\n"
#define msg_logout "You are logged out\n"
#define msg_no_compute "Do not compute. Please try again\n"
#define msg_ip "Not a valid ip address\n"
#define msg_port "Not a valid port\n"
#define msg_user_in "Target is logged in\n"
#define msg_user_not_in "Target is not logged in\n"

#define check_nick strcmp(db[i].nick, nick)
#define check_pass strcmp(db[i].password, pass)
#define check_localhost strcmp(ip, "localhost")

char * users_logged_in();
void lookup(int fd, char* nick);
struct user* init_db();
struct user* db = NULL;
char client_hostname[MAXLINE], client_port[MAXLINE];

struct user {
  char *nick;
  char *password;
  int loggedIn;
  int id;
};

int isValidIpAddress(char *ipAddress){
  struct sockaddr_in sa;
  int result = inet_pton(AF_INET, ipAddress, &(sa.sin_addr));
  return (result != 0);
}

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
  char nick[32];
  char pass[32];
  char ip[32];
  char port[32];
  int ip_check = 0;

  Rio_readinitb(&rio, connfd);


  while((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0) {

    printf("server received %d bytes\n", (int)n);

    strcpy(tok_buf,buf);

    // tokenize
    token[0] = strtok(tok_buf, delim);
    for(int i = 1;i<5;i++){
      token[i] = strtok(NULL, delim);
    }
    printf("TOKENS 0-4 ARE: %s %s %s %s %s\n", token[0], token[1], token[2], token[3], token[4]);
    strcpy(request,token[0]);
    printf("REQUEST received is %s\n", request);

    //LOGIN
    if(strcmp (request, "/login")==0){
      if (flag == 1){
        Rio_writen(connfd, msg_in, strlen(msg_in));
      }
      else{
        printf("LOGGIN IN\n");
        sscanf(buf, "/login %s %s %s %s\n", nick,pass,ip,port);
        printf("Login attempted with: %s\n", nick);
        ip_check = isValidIpAddress(ip);
        if (check_localhost != 0 && ip_check == 0) {
          Rio_writen(connfd, msg_ip, strlen(msg_ip));
        }
        else if (atoi(port) <= 0 || atoi(port) > 65536){
          Rio_writen(connfd, msg_port, strlen(msg_port));
        }
        else{
          for(int i=0; i <= 3; i++){
            if (i > 2){
              Rio_writen(connfd, msg_login_fail, strlen(msg_login_fail));
              printf("%s is already logged in\n", nick);
            }
            else if (((check_nick == 0) && (check_pass == 0)) && (db[i].loggedIn == 0) && (db[i].id == 0 || db[i].id != *client_port)){
              db[i].loggedIn = 1;
              db[i].id = *client_port;
              Rio_writen(connfd, "Welcome\n", 8);
              printf("%s has logged in\n", db[i].nick);
              printf("%s's IP address is: %s\n", db[i].nick, client_hostname);
              printf("%s's port is: %s\n", db[i].nick, client_port);
              printf("%s has a loggedin status of %d\n", db[i].nick, db[i].loggedIn);
              break;
            }
            else{
                printf("Running loop again\n");
            }
          }
        }
      }
    }
  //LOOKUP
  else if(strcmp (request, "/lookup")==0){
    printf("LOOKING UP\n");
    for(int i=0; i <= 3; i++){
      if (i > 2){
        Rio_writen(connfd, msg_not_in, strlen(msg_not_in));
      }
      else if (db[i].id == *client_port){
        lookup(connfd, token[1]);
        break;
      }
      else {
        printf("Running loop again\n");
      }
    }
  }
  //LOGOUT
  else if(strcmp (request, "/logout")==0){
    printf("LOGGING OUT\n");
    for(int i=0; i <= 3; i++){
      if(i > 2){
        Rio_writen(connfd, msg_not_in, strlen(msg_not_in));
      }
      if (db[i].id == *client_port){
        db[i].loggedIn = 0;
        db[i].id = 0;
        Rio_writen(connfd, msg_logout, strlen(msg_logout));
        break;
      }
      else {
        printf("Running loop again\n");
      }
    }
  }
  //EXIT
  else if(strcmp (request, "/exit")==0){
    printf("EXITTING NOW\n");
    close(connfd);
    exit(0);
  }
  else{
    Rio_writen(connfd, msg_no_compute, strlen(msg_no_compute));
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
  one.loggedIn = 0;

  struct user two;
  two.nick = "Bro";
  two.password = "orb2";
  two.loggedIn = 0;

  struct user three;
  three.nick = "Chip";
  three.password = "pihc3";
  three.loggedIn = 0;

  db[0] = one;
  db[1] = two;
  db[2] = three;

  return db;
}

void lookup(int fd, char* target){
  // lookup specific user
  if(target != NULL){
    for(int i=0; i < 3; i++){
      if((strcmp(target, db[i].nick)==0) && (db[i].loggedIn == 1)){
        Rio_writen(fd, msg_user_in, strlen(msg_user_in));
        return;
      }
    }
    Rio_writen(fd, msg_user_not_in, strlen(msg_user_not_in));
  }
  // lookup all
  else{
    char *users = users_logged_in();
    Rio_writen(fd, users, strlen(users));
  }
}

char * users_logged_in(){
  static char str_out[256];
  strcpy(str_out,"[ ");
  for(int i=0; i<3; i++){
    if(db[i].loggedIn == 1){
      strcat(str_out, db[i].nick);
      strcat(str_out, " ");
    }
  }
  strcat(str_out, "]\n");
  return str_out;
}
