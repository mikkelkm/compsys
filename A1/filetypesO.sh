#!/bin/bash

make clean

make fileO

# test 1
printf "hemmelighed" > hemmelig_fil
chmod -r hemmelig_fil

echo "file(1) VS our guess:"
file hemmelig_fil
./fileO hemmelig_fil
echo " "

rm hemmelig_fil

# test 2

echo "file(1) VS our guess:"
file volapyk
./fileO volapyk
echo " "

# test 3-9
for f in testfiler_til_A1/*
 	 
do
    echo "file(1) VS our guess:"
    file $f
    ./fileO $f
    echo " " 
done

