#include "transducers.h"
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>

struct stream {
  FILE* file;
  int flag;
};

//Hint from assignment
//Creates FILE* objects from pipes
static int file_pipe(FILE* files[2]) {
  int fds[2];
  int r = pipe(fds);

  if (r == 0) {
    files[0] = fdopen(fds[0], "r");
    files[1] = fdopen(fds[1], "w");

    if (files[0] && files[1]) {
      return 0;
    } else {
      return 1;
    }
  } else {
    return r;
  }
}

//Self-explanatory, frees the stream when needed
void transducers_free_stream(stream *s){
  fclose(s->file);
  free(s);
}

//Transducer used to create a stream
int transducers_link_source(stream **out,
                            transducers_source s,const void *arg) {

  FILE* files[2];
  assert(file_pipe(files)==0);

  pid_t ret = fork();

  if (ret == 0) {
    s(arg, files[1]);
    exit(0);
  }
  assert(fclose(files[1])==0);
  stream* str = malloc(sizeof(stream)); //Allocating memory for the stream
  str -> file = files[0];
  str -> flag = 0;
  *out = str ;
  return 0;
}

/* Transducer which uses the flag from our stream struct, to block
untill the transducer function returns. */
int transducers_link_sink(transducers_sink s, void *arg, stream *in) {

  if (in -> flag == 1) {
    return 1;
  }
  in -> flag = 1;
  s(arg, in -> file);
  return 0;
}

// Transducer used to work between 1 input stream and 1 output stream
int transducers_link_1(stream **out,
                       transducers_1 t, const void *arg,
                       stream* in) {

  if (in -> flag == 1) {
    return 1;
  }
  in -> flag = 1;

  FILE* files[2];
  assert(file_pipe(files)==0);
  pid_t ret = fork(); //Generates a child and a parent process

  //Child process which works the input and exits
  if (ret == 0) {
    t(arg, files[1], in -> file);
    exit(0);
  }

  //Parent process which allocates memory, writes to FILE* and struct
  assert(fclose(files[1])==0);
  stream* str = malloc(sizeof(stream));
  str -> file = files[0];
  str -> flag = 0;
  *out = str ;
  return 0;
}



/*Very similar to transducers_link_1, exception being that most operations
are done twice, because of the 2 input streams. */
int transducers_link_2(stream **out,
                       transducers_2 t, const void *arg,
                       stream* in1, stream* in2) {

  if (in1 -> flag == 1 || in2 -> flag == 1 ) {
    return 1;
  }
  in1 -> flag = 1;
  in2 -> flag = 1;

  FILE* pipe_ports[2];
  assert(file_pipe(pipe_ports)==0);

  pid_t ret = fork();

  if (ret == 0) {
    //write both inputs to single FILE*
    t(arg, pipe_ports[1], in1 -> file, in2 -> file);
    exit(0);
  }

  assert(fclose(pipe_ports[1])==0);
  stream* str = malloc(sizeof(stream));
  str -> file = pipe_ports[0];
  str -> flag = 0;
  *out = str ;
  return 0;
}


/*Transducer to duplicate an input stream, into two differnet output streams.
In the same fashion as transducers_link_2, many operations are done twice. */
int transducers_dup(stream **out1,stream **out2, stream *in) {

  if (in -> flag == 1){
    return 1;
  }
  in -> flag = 1;

  //Generating a FILE* twice, so we can access both output streams
  FILE* files1[2];
  FILE* files2[2];
  assert(file_pipe(files1) == 0);
  assert(file_pipe(files2) == 0);

  pid_t ret = fork();

  if (ret == 0) {
    char c;
    while (fread(&c, sizeof(char), 1, in -> file) == 1 )
    {
      fwrite(&c, sizeof(char), 1, files1[1]);
      fwrite(&c, sizeof(char), 1, files2[1]);
    }
    exit(0);
  }

  assert(fclose(files1[1])==0);
  assert(fclose(files2[1])==0);
  stream* str1 = malloc(sizeof(stream));
  stream* str2 = malloc(sizeof(stream));
  *out1 = str1;
  *out2 = str2;
  str1 -> file = files1[0];
  str2 -> file = files2[0];

  return 0;
}
