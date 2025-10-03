#!/bin/bash

source setup_env
cd zsim
scons -j4
clear
mkdir -p hw2_runlogs
benchmarks=("blackscholes" "bodytrack" "dedup" "canneal" "fluidanimate" "freqmine" "streamcluster" "swaptions" "x264")
automata=("A2" "A3")

for auto in "${automata[@]}"; do
  for bench in "${benchmarks[@]}"; do
    if [[ "$bench" == "dedup" ]]; then
      continue

    else
      session_name="${auto}_${bench}"
  
      ./hw2runscript $bench $auto > hw2_runlogs/${session_name}.log 2>&1

      echo "Launched $auto $bench"

    fi

  done
done
cd ..