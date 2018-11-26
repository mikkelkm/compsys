#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <semaphore.h>
#include <pthread.h>

#include "job_queue.h"

int job_queue_init(struct job_queue *job_queue, int capacity) {
job_queue->queue = calloc(capacity, sizeof(pthread_t)); //Allocating memory for the buffer
//job_queue->queue = malloc(capacity*sizeof(pthread_t)); //Allocating memory for the buffer

    assert(pthread_mutex_init(&job_queue->mutex, NULL)==0);
    assert(pthread_cond_init(&job_queue->give, NULL)==0);
    assert(pthread_cond_init(&job_queue->take, NULL)==0);
    job_queue->capacity = capacity;
    job_queue->jobs = 0;
    job_queue->head = 0;
    job_queue->tail = 0;
    return 1;
}

int job_queue_destroy(struct job_queue *job_queue) {
    printf(">DESTROY called \n");
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs != 0 ){
        printf(">DESTROY [waiting] \n");
        pthread_cond_wait(&job_queue->give, &job_queue->mutex);
        printf(">DESTROY receives GIVE signal \n");
    }
    printf(">DESTROY counts jobs: %d \n", job_queue->jobs);
    //free(job_queue->queue); //free void **?
    pthread_mutex_unlock(&job_queue->mutex); //er denne nødvendig?
    return 0;
}

int job_queue_push(struct job_queue *job_queue, void *data) {
    printf(">PUSH called \n");
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == job_queue->capacity){
        printf(">PUSH [waiting] \n");
        pthread_cond_wait(&job_queue->give, &job_queue->mutex);
        printf(">PUSH receives GIVE signal \n");
    }
    job_queue->head = job_queue->head+1;
    job_queue->queue[job_queue->head % job_queue->capacity] = data;
    job_queue->jobs = job_queue->jobs+1;
    pthread_cond_signal(&job_queue->take);
    printf(">TAKE signal \n");
    pthread_mutex_unlock(&job_queue->mutex);
    return 0;
}

int job_queue_pop(struct job_queue *job_queue, void **data) {
    printf(">POP called \n");
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == 0){
        printf(">POP [waiting] \n");
        pthread_cond_wait(&job_queue->take, &job_queue->mutex);
        printf(">POP receives TAKE signal \n");
    }
    *data == job_queue->queue[job_queue->tail  % job_queue->capacity];
    job_queue->tail = job_queue->tail+1;
    job_queue->jobs = job_queue->jobs-1;
    pthread_cond_signal(&job_queue->give);
    printf(">GIVE signal \n");
    pthread_mutex_unlock(&job_queue->mutex);
    return 0;
}
