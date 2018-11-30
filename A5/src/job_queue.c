#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <semaphore.h>
#include <pthread.h>

#include "job_queue.h"

int job_queue_init(struct job_queue *job_queue, int capacity) {
    job_queue->queue = calloc(capacity, sizeof(void*)); //Allocating memory for the buffer

    assert(pthread_mutex_init(&job_queue->mutex, NULL)==0);
    assert(pthread_cond_init(&job_queue->cond, NULL)==0);
    job_queue->capacity = capacity;
    job_queue->jobs = 0;
    job_queue->head = 0;
    job_queue->tail = 0;
    job_queue->dead = 0; 
    return 1;
}

int job_queue_destroy(struct job_queue *job_queue) {
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs != 0 ){
        pthread_cond_wait(&job_queue->cond, &job_queue->mutex);
    }
    printf("destroyed \n");
    
    free(job_queue->queue);
    job_queue->dead = 1;
    pthread_cond_broadcast(&job_queue->cond);
    pthread_mutex_unlock(&job_queue->mutex);
    return 0;
}

int job_queue_push(struct job_queue *job_queue, void *data) {
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == job_queue->capacity && !job_queue->dead){
        pthread_cond_wait(&job_queue->cond, &job_queue->mutex);
    }
    if (job_queue->dead) {
        pthread_mutex_unlock(&(job_queue->mutex));
        return 1;
    } 
    job_queue->head = job_queue->head+1;
    job_queue->queue[job_queue->head % job_queue->capacity] = data;
    job_queue->jobs = job_queue->jobs+1;
    pthread_cond_broadcast(&job_queue->cond);
    pthread_mutex_unlock(&job_queue->mutex);
    return 0;
}

int job_queue_pop(struct job_queue *job_queue, void **data) {
    pthread_mutex_lock(&job_queue->mutex);
    while(job_queue->jobs == 0 && !job_queue->dead){             
        pthread_cond_wait(&job_queue->cond, &job_queue->mutex);
    }
    if (job_queue->dead) {
        pthread_mutex_unlock(&(job_queue->mutex));
        return 1;
    } 
    *data = job_queue->queue[job_queue->tail+1 % job_queue->capacity];
    job_queue->tail = job_queue->tail+1;
    job_queue->jobs = job_queue->jobs-1;
    pthread_cond_broadcast(&job_queue->cond);
    pthread_mutex_unlock(&job_queue->mutex);
    return 0;
}
