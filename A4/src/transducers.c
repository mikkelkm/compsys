#include "transducers.h"
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>

struct stream {
  FILE* file;
  int flag;
};

// hint from assigment
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





void transducers_free_stream(stream *s){
  fclose(s->file);
  free(s);
}



int transducers_link_source(stream **out,
                            transducers_source s,
                            const void *arg) {

        // file in and out
    FILE* files[2];
        // open files and set to read only and write only
    assert(file_pipe(files)==0);
    pid_t ret = fork();

        //child process
    if (ret == 0) {
            //close pipe file in
        assert(fclose(files[0])==0);
            //put arg in pipe out file
        s(arg, files[1]);
        exit(0);
    }
    else {
            // close pipe out file
        assert(fclose(files[1])==0);
            // allocate mem for a stream
        stream * str = malloc(sizeof(stream));
            // initiate values in struct
        str -> file = files[0];
        str -> flag = 0;
        *out = str ;
        return 0;
    }
    return 1;
}


int transducers_link_sink(transducers_sink s,
                          void *arg,
                          stream *in) {

        // does the stream have a reader?
    if (in -> flag == 0) {
        in -> flag = 1;
        s(arg, in -> file);
        return 0;
    }
    return 1;
}

int transducers_link_1(stream **out,
                       transducers_1 t,
                       const void *arg,
                       stream* in) {

    if (in -> flag == 0) {
        FILE* files[2];
        assert(file_pipe(files)==0);
        pid_t ret = fork();

        if (ret == 0) {
            in -> flag = 1;
            assert(fclose(files[0])==0);
            t(arg, files[1], in -> file);
        }
        else {
            assert(fclose(files[1])==0);
            stream * str = malloc(sizeof(stream));
            str -> file = files[0];
            str -> flag = 0;
            *out = str ;
        }
        return 0;
    }
    return 1;
}

int transducers_link_2(stream **out,
                       transducers_2 t,
                       const void *arg,
                       stream* in1,
                       stream* in2) {

    if (in1 -> flag == 0) {
      FILE* pipe_ports[3];
      assert(file_pipe(pipe_ports)==0);
      pid_t ret = fork();

      if (ret == 0) {
        in1 -> flag = 1;
        in2 -> flag = 1;
        assert(fclose(pipe_ports[0])==0);
        t(arg, pipe_ports[2], in1, in2 -> file);
        }
      else {
        assert(fclose(pipe_ports[1])==0);
        for (size_t i = 0; i < 2; i++) {
          stream * str = malloc(sizeof(stream));
          str -> file = pipe_ports[i];
          str -> flag = 0;
          *out = str ;
        }
      }
      return 0;
  }
  return 1;
}

//Virker ikke endnu
int transducers_dup(stream **out1,
                    stream **out2,
                    stream *in) {

  if (in -> flag == 0){
    FILE* pipe_ports1[2];
    assert(file_pipe(pipe_ports1) == 0);
    FILE* pipe_ports2[2];
    assert(file_pipe(pipe_ports2) == 0);
    pid_t ret = fork();
  }
  return 1;

}
