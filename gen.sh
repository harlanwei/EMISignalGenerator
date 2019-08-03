#!/bin/bash

# 1 -> pink noise
# 2 -> brown
# 3 -> laplace
# 4 -> uniformrv
# 5 -> exponentialrv

OUTPUT_FILE="../data.txt"
SAMPLE_LENGTH=1000

# $1: the command to execute
# $2: the label for the command
function execute() {
    for i in $(seq 1 $SAMPLE_LENGTH)
    do
        $1 $i >> $OUTPUT_FILE
        echo $2 >> $OUTPUT_FILE
    done
}

echo 'Compiling signal generators with gcc...'
mkdir build 2>/dev/null
cd build
cmake ../src
make
cd ../dist

rm "$OUTPUT_FILE" 2>/dev/null

echo 'Generating with pinkgen...'
execute './pinkgen 10 1000 1.0' 1

echo 'Generating with brownrv...'
execute './brownrv 1000 0.0 1.0' 2

echo 'Generating with laplace...'
execute './laplace 1000 0.0 1.0' 3

echo 'Generating with uniformrv...'
execute './uniformrv 1000 -1.0 1.0' 4

echo 'Generating with exponentialrv...'
execute './exponentialrv 1000 1.0' 5

wc -l "$OUTPUT_FILE"