#!/bin/bash

cd ../simplesim-3.0/
make sim-bpred
cd ../benchmarks
cp ../simplesim-3.0/sim-bpred ./sim-bpred
chmod +x sim-bpred
read  -p "Make above Press key to continue:" mainmenuinput -n 1
./sim-bpred $SIM_FLAGS anagram.alpha words < anagram.in > OUT
read  -p "anagram above Press key to continue:" mainmenuinput -n 1
./sim-bpred $SIM_FLAGS cc1.alpha -O 1stmt.i
read  -p "gcc above Press key to continue:" mainmenuinput -n 1
./sim-bpred $SIM_FLAGS go.alpha 50 9 2stone9.in > go.OUT
read  -p "go above Press key to continue:" mainmenuinput -n 1
