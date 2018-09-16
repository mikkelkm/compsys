#!/bin/bash

make fileO

# test 1
printf "hemmelighed" > hemmelig_fil
chmod -r hemmelig_fil

echo "file VS our guess:"
file hemmelig_fil
./fileO hemmelig_fil
echo " "

rm hemmelig_fil

# test 2

echo "file VS our guess:"
file volapyk
./fileO volapyk
echo " "

# test 3-9
for f in testfiler_til_A1/*
 	 
do
    echo "file VS our guess:"
    file $f
    ./fileO $f
    echo " " 
done

