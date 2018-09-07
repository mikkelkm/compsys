#!/usr/bin/env bash

# Exit immediately if any command below fails.
set -e

make


echo "Generating a test_files directory.."
mkdir -p test_files
rm -f test_files/*


echo "Generating test files.."
printf "Hello, World!\n" > test_files/ascii.input
printf "Hello, World!" > test_files/ascii2.input
printf "1234567890+" > test_files/ascii3.input
printf "{|}~" > test_files/ascii4.input
printf "<test ME>" > test_files/ascii5.input
printf "!\#$%%&'()*+" > test_files/ascii6.input
printf ",-./" > test_files/ascii7.input
printf ":;<=>?" > test_files/ascii8.input
printf "@ABCDEFGHIJKLMNOPQRSTUVWXYZ" > test_files/ascii9.input
printf "[\]^_\`" > test_files/ascii10.input
printf "abcdefghijklmnopqrstuvwxyz" > test_files/ascii11.input
printf "   " > test_files/ascii12.input


printf "Hello,\x00World!\n" > test_files/data.input
printf "TEST \x6Bn \n" > test_files/data2.input
printf "TEST \x61 \n" > test_files/data3.input
printf "TEST \x7E \n" > test_files/data4.input
printf "TEST \x25 \n" > test_files/data5.input
printf "TEST \x2B \n" > test_files/data6.input
printf "TEST \x30 \n"> test_files/data7.input
printf "TEST \x3A \n" > test_files/data8.input
printf "TEST \x40 \n" > test_files/data9.input
printf "TEST \x41 \n" > test_files/data10.input
printf "TEST \x5A \n"> test_files/data11.input
printf "TEST \x5D" > test_files/data12.input







printf "" > test_files/empty.input

### TODO: Generate more test files ###


echo "Running the tests.."
exitcode=0
for f in test_files/*.input
do
  echo ">>> Testing ${f}.."
  file    "${f}" | sed 's/ASCII text.*/ASCII text/' > "${f}.expected"
  ./file  "${f}" > "${f}.actual"

  if ! diff -u "${f}.expected" "${f}.actual"
  then
    echo ">>> Failed :-("
    exitcode=1
  else
    echo ">>> Success :-)"
  fi
done
exit $exitcode
