#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <errno.h>

#define BUFSIZE 2048

void send_recv(int i, int sockfd)
{
	char send_buf[BUFSIZE];
	char tok_buf[BUFSIZE];
	char recv_buf[BUFSIZE];
	char empt_buf[BUFSIZE];
	int nbyte_recvd;
	char *token1;
	char *token2;
	char *hack = send_buf + 5;
	const char s[2] = " ";
	int rdy = 0;
	char temp_buf[BUFSIZE];
	while(1){
		fgets(send_buf, BUFSIZE, stdin);
		strcpy(tok_buf, send_buf);
		token1 = strtok(tok_buf, s);
		token2 = strtok(tok_buf, s);
		if (strcmp(send_buf, "/exit\n") == 0){
			exit(0);
		}
		if (strcmp(token1, "/msg") == 0){
			send(sockfd, hack, strlen(send_buf), 0);
		}
		if (strcmp(send_buf, "/show\n") == 0){
			if(rdy == 0){
				printf("No new messages yet, try again\n");
				printf("%s\n", recv_buf);
				rdy = 1;
			}
			else{
				nbyte_recvd = recv(sockfd, recv_buf, BUFSIZE, 0);
				recv_buf[nbyte_recvd] = '\0';
				strcpy(temp_buf, recv_buf);
				if(rdy == 1){
					printf("%s", temp_buf);
					rdy = 0;
				}
				else{
					printf("%s\n", recv_buf);
					strcpy(temp_buf, "");
				}
			}
		}
		else if(strcmp(token1, "/msg") > 0){
		//send(sockfd, send_buf, strlen(send_buf), 0);
		printf("Invalid input, use /msg to chat, /show to recieve messages, and /exit to logout\n");
		fflush(stdout);
			//send(sockfd, send_buf, strlen(send_buf), 0);
		}
/*	else{
		nbyte_recvd = recv(sockfd, recv_buf, BUFSIZE, 0);
		recv_buf[nbyte_recvd] = '\0';
		printf("%s" , recv_buf);
		fflush(stdout); */
	}
}


void connect_request(int *sockfd, struct sockaddr_in *server_addr)
{
	if ((*sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
		perror("Socket");
		exit(1);
	}
	server_addr->sin_family = AF_INET;
	server_addr->sin_port = htons(4950);
	server_addr->sin_addr.s_addr = inet_addr("127.0.0.1");
	memset(server_addr->sin_zero, '\0', sizeof server_addr->sin_zero);

	if(connect(*sockfd, (struct sockaddr *)server_addr, sizeof(struct sockaddr)) == -1) {
		perror("connect");
		exit(1);
	}
}

int main(){
	int sockfd, fdmax, i;
	struct sockaddr_in server_addr;
	fd_set master;
	fd_set read_fds;

	connect_request(&sockfd, &server_addr);
	FD_ZERO(&master);
  FD_ZERO(&read_fds);
  FD_SET(0, &master);
  FD_SET(sockfd, &master);
	fdmax = sockfd;

	while(1){
		read_fds = master;
		if(select(fdmax+1, &read_fds, NULL, NULL, NULL) == -1){
			perror("select");
			exit(4);
		}

		for(i=0; i <= fdmax; i++ )
			if(FD_ISSET(i, &read_fds))
				send_recv(i, sockfd);
	}
	printf("client-quited\n");
	close(sockfd);
	return 0;
}
