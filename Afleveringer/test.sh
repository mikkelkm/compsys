#!/usr/bin/env bash

# Exit immediately if any command below fails.
set -e

make


echo "Generating a test_files directory.."
mkdir -p test_files
rm -f test_files/*


echo "Generating test files.."

# DATA test char 0 and 6
printf "Hello,\x00 World!\n" > test_files/data1.input
printf "TEST \x06 \n" > test_files/data2.input

# ASCII test char 7 and 13
printf "TEST \x07 \n" > test_files/asciiA.input
printf "TEST \x0D \n" > test_files/asciiB.input

# DATA test char 14 and 26
printf "TEST \x0E \n" > test_files/data3.input
printf "TEST \x1A \n" > test_files/data4.input

# ASCII test char 27
printf "TEST \x1B \n" > test_files/asciiC.input

# DATA test char 28 and 31 
printf "TEST \x1C \n" > test_files/data5.input
printf "TEST \x1F \n" > test_files/data6.input

# ASCII test broad spectred test (char 32 to 126)
printf "   " > test_files/ascii1.input
printf "Hello, World!\n" > test_files/ascii2.input
printf "1234567890+" > test_files/ascii3.input
printf "{|}~" > test_files/ascii4.input
printf "<test ME>" > test_files/ascii5.input
printf "!\#$%%&'()*+" > test_files/ascii6.input
printf ",-./" > test_files/ascii7.input
printf ":;<=>?" > test_files/ascii8.input
printf "@ABCDEFGHIJKLMNOPQRSTUVWXYZ" > test_files/ascii9.input
printf "[\]^_\`" > test_files/ascii10.input
printf "abcdefghijklmnopqrstuvwxyz" > test_files/ascii11.input

# DATA test different chars between 127 and 255 
printf "TEST \x7F \n" > test_files/data7.input
# The tests below output ISO-8859 text, thus fail when compared to "data"
# printf "TEST \x99 \n" > test_files/data8.input
# printf "TEST \xBB \n" > test_files/data9.input
# printf "TEST \xCC \n" > test_files/data10.input
# printf "TEST \xDD \n"> test_files/data11.input
# printf "TEST \xFF" > test_files/data12.input

# EMPTY test
printf "" > test_files/empty.input

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
