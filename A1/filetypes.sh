#!/bin/bash

for f in *
do
    echo "file VS our guess:"
    file $f
    ./fileN $f
    echo " " 
done

