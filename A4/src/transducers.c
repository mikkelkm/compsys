#include "transducers.h"

struct stream {
  int dummy; /* replace with implementation. */
  FILE* f; //Skal indeholde en fil
};

void transducers_free_stream(stream *s) {
    free(s);
}



int transducers_link_source(stream **out,
                            transducers_source s, const void *arg) {
    // put arguments in out stream
    if (fork()==0)
                        //child
    else
                        //Parent
    s(arg,&out);
    (*s) -> f //"referer pointer til en pointer"
    // return i 0, not 1, so assert in test0.c works
    return 0;
}

int transducers_link_sink(transducers_sink s, void *arg,
                          stream *in) {
    s(arg,in);

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
  out1=out1; /* unused */
  out2=out2; /* unused */
  in=in; /* unused */
  return 1;
}
