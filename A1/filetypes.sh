#!/bin/bash

make clean

make file

echo " "

# test 1
printf "clandestine clandestine clandestine" > hemmelig_fil
chmod -r hemmelig_fil

echo "Secret file, testing:"
echo "file(1) VS our guess:"
file hemmelig_fil
./file hemmelig_fil
echo " "

rm hemmelig_fil

# test 2

echo "Non-existing file, testing:"
echo "file(1) VS our guess:"
file navn1
./file navn2
echo " "

# test 3-9
for f in testfiler_til_A1/*
do
    echo "file(1) VS our guess:"
    file $f
    ./file $f
    echo " "
done
