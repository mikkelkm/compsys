#!/bin/bash

make clean

make fileN

echo " " 

# test 1
printf "hemmelighed" > hemmelig_fil
chmod -r hemmelig_fil

echo "Hemmelig fil testes:"
echo "file(1) VS our guess:"
file hemmelig_fil
./fileN hemmelig_fil
echo " "

rm hemmelig_fil

# test 2

echo "ikke-eksisterende fil testes:"
echo "file(1) VS our guess:"
file navn1
./fileN navn2
echo " "

# test 3-9
for f in testfiler_til_A1/*	 
do
    echo "file(1) VS our guess:"
    file $f
    ./fileN $f
    echo " " 
done

