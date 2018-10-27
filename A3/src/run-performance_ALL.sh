#!/bin/sh

machines=(baseline memory simple superscalar ooo)
algorithms=(quicksort heapsort yoursort yoursort_OPT)

rm -f ./data/*.data

for algo in "${algorithms[@]}"
do
    for mach in "${machines[@]}"
    do
        ./run-performance.sh $algo $mach
    done
done
