#!/bin/sh

machines=(baseline memory simple superscalar ooo)
algorithms=(quicksort heapsort yoursort)


for algo in "${algorithms[@]}"
do
    for mach in "${machines[@]}"
    do
        ./run-performance.sh $algo $mach
    done
done
