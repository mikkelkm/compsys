#include "transducers.h"

struct stream {
    FILE* in; 
    FILE* out;
};

void transducers_free_stream(stream *s){
    FILE *in = &(s)->in;
    FILE *out = &(s)->in;
    fclose(in);
    fclose(out);    
}


int transducers_link_source(stream **out,
                            transducers_source s, const void *arg) {

     // put arguments in out stream
    if (fork()==0){  //child
        *s(arg,&out);
        // return for child
        return 0;
    }
    else{
            //Parent
            // return for parent
        return 0;
        
    }
    
    (*s) -> f //"referer pointer til en pointer"
        
    return 1;
}

int transducers_link_sink(transducers_sink s, void *arg,
                          stream *in) {
    s(arg,in);

    return 1;
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
