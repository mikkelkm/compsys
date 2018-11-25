#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <semaphore.h>
#include <pthread.h>

#include "job_queue.h"

int job_queue_init(struct job_queue *job_queue, int capacity) {
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
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs != 0 ){
        pthread_cond_wait(&job_queue->give, &job_queue->mutex);
    }
    free(job_queue); // er det her rigtigt?
    pthread_mutex_unlock(&job_queue->mutex); //er denne nødvendig?
    return 1;
}

int job_queue_push(struct job_queue *job_queue, void *data) {
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == job_queue->capacity){
        pthread_cond_wait(&job_queue->give, &job_queue->mutex);
    }
    assert(job_queue->head++);    
    assert(job_queue->queue[job_queue->head] = data);
    assert(job_queue->jobs++);
    pthread_cond_signal(&job_queue->take);
    pthread_mutex_unlock(&job_queue->mutex);
    return 1;
}

int job_queue_pop(struct job_queue *job_queue, void **data) {
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == 0){
        pthread_cond_wait(&job_queue->take, &job_queue->mutex);
    }
    assert(&data == job_queue->queue[job_queue->head]);
    assert(job_queue->head--);     
    assert(job_queue->jobs--);
    pthread_cond_signal(&job_queue->give);
    pthread_mutex_unlock(&job_queue->mutex);
    return 1;
}
