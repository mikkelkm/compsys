

int login(char *nick, char *password, char *IP, char *port){
    printf("logged in at %s %s with %s %s \n",IP,port,nick,password);
    return 1;
}


/*


if (argc != ARGNUM + 1) {
        printf("%s expects %d arguments.\n", (argv[0]+2), ARGNUM);
        return(0);
    }
    
    char *IP = argv[1]; // IP address of name server?
    char *port = argv[2];     // Port of name server?
       
    if(strcmp(IP, IP_nameserver)!=0){
        printf("Unknown host \n");
        return 1;
    }
    else if(strcmp(port, port_nameserver)!=0){
        printf("Unknown port \n");
        return 1;
    }

    // create connection to nameserver
        // int clientfd = open_clientfd(IP,port);
        //assert(clientfd > 0);
    
    
        // printf("/login ");


// CB:  The syntax for the command is :
//      /login <nick> <password> <IP> <Port>
    
    
*/
