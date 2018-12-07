

int login(char *nick, char *password, char *IP, char *port){

    printf("logged in at %s %s with %s %s \n",IP,port,nick,password);

    int clientfd = open_clientfd(IP,port);

    //assert(clientfd>0);
    
    return 1;
}


