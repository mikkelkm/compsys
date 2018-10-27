#!/bin/bash

# Set path so it matches your installation:
# This is set to Baun's path to .py solution of x86prime
x86prime=/Users/baunbaun/Documents/computersystemer_BAUN/compSys-e2018-pub/tools/x86prime.py

if [ "$#" -ne 2 ]; then
   echo "Running some x86prime programs"
   echo "Usage:"
   echo "  ./run-performance [Sorting Algorithm] [Machine]"
   echo "    Sorting Algorithm: Sorting algorithm you want to run"
   echo "    Machine: the type of machine to run"
   exit 1;
fi

algorithm=""
if [[ "${1}" == "quicksort" ]]; then
  algorithm="quicksort"
fi
if [[ "${1}" == "heapsort" ]]; then
  algorithm="heapsort"
fi
if [[ "${1}" == "yoursort" ]]; then
  algorithm="yoursort"
fi
if [[ "${1}" == "yoursort_OPT" ]]; then
  algorithm="yoursort_OPT"
fi
if [[ "${algorithm}" == "" ]]; then
  echo "Algorithm set to unknown value: ${1}"
  exit 1;
fi

# MACHINE DEFINITIONS

# The baseline setting with magic cache. It is a very large L1 cache. For assignment 1.2.1
baseline="-mem magic -pipe simple"
# The setting for testing realistically caches (3 caches). For assignment 1.2.2
memory="-mem real -pipe simple"
# The 3 microarchitectures for assignment 1.2.3
simple="-mem real -pipe simple"
superscalar="-mem real -pipe super"
ooo="-mem real -pipe ooo"

machine=""
if [[ "${2}" == "baseline" ]]; then
  machine=${baseline}
fi
if [[ "${2}" == "memory" ]]; then
  machine=${memory}
fi
if [[ "${2}" == "simple" ]]; then
  machine=${simple}
fi
if [[ "${2}" == "superscalar" ]]; then
  machine=${superscalar}
fi
if [[ "${2}" == "ooo" ]]; then
  machine=${ooo}
fi
if [[ "${machine}" == "" ]]; then
  echo "Machine set to unknown value: ${2}"
  exit 1;
fi

# Make sure code is up to date
# make $1

# Create for runs
mkdir -p runs
rm -f runs/*

# Number for elements to be sorted (to be extended)
elements="10 100 500 1000 5000 10000 50000 100000"

# Generate files with inputs for things to be sorted
for elem in ${elements}
do
  printf "0\n${elem}\n" > runs/run-${elem}.input
done

echo "Machine:" ${2}
echo "-------"
echo ""
echo "Sorting with" ${1}
echo "===================================="
for elem in ${elements}
do
  datafile="data/${algorithm}-${2}-${elem}.data"
  echo ""
  echo " - sorting" ${elem} "entries"
  echo "   ------------------"
  #${x86prime} -f ${1}.s_prime -asm $machine -run run < runs/run-${elem}.input > ${datafile}
  # Below is the way to run with .py solution. The line above is when you run local.
  ${x86prime} -f ${1}.s_prime -asm $machine -run run -input runs/run-${elem}.input > ${datafile}
  cat ${datafile}
done
