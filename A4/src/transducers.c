#include "transducers.h"
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>

struct stream {
  FILE* file;
  int flag;
};

void transducers_free_stream(stream *s){
  free(s);
}

static int file_pipe(FILE* files[2]) {  // hint from assigment
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


int transducers_link_source(stream **out,
                            transducers_source s, const void *arg) {
                              FILE* pipe_ports[2];
assert(file_pipe(pipe_ports)==0);
pid_t ret = fork();

if (ret == 0) {
  assert(fclose(pipe_ports[0])==0);
  s(arg, pipe_ports[1]);
  exit(0);
}
else {
  assert(fclose(pipe_ports[1])==0);
  stream * str = malloc(sizeof(stream));
  str -> file = pipe_ports[0];
  str -> flag = 0;
  *out = str ;
}
return 0;
}




int transducers_link_sink(transducers_sink s, void *arg,
                          stream *in) {
if (in -> flag == 0) {
  in -> flag = 1;
  s(arg, in -> file);
  } else {
    return 1;
  }
  return 0;
}

int transducers_link_1(stream **out,
                       transducers_1 t, const void *arg,
                       stream* in) {



  out=out; /* unused */
  t=t; /* unused */
  arg=arg; /* unused */
  in=in; /* unused */
  return 1;
}

int transducers_link_2(stream **out,
                       transducers_2 t, const void *arg,
                       stream* in1, stream* in2) {
  out=out; /* unused */
  t=t; /* unused */
  arg=arg; /* unused */
  in1=in1; /* unused */
  in2=in2; /* unused */
  return 1;
}

int transducers_dup(stream **out1, stream **out2,
                    stream *in) {

// CHR: Lav 1 x fork() fra stream *in som giver out1
// Lav 1 x fork() fra stream *in som giver out2
// returner 0;



  out1=out1; /* unused */
  out2=out2; /* unused */
  in=in; /* unused */
  return 1;
}
