#!/bin/bash

# 1 -> pink noise
# 2 -> brown
# 3 -> laplace
# 4 -> uniformrv
# 5 -> exponentialrv

USAGE_STRING="Usage:
    bash $0 [pink] [brown] [laplace] [uniform] [exponential]
or
    bash $0 [length]"
OUTPUT_FILE='../data.txt'
SAMPLE_LENGTH=1000

function print_usage {
    echo "$USAGE_STRING"
    exit 1
}

# $1: the command to execute
# $2: the label for the command
# $3: the number of samples to be generated
function execute {
    for i in $(seq 1 $3)
    do
        $1 $i >> $OUTPUT_FILE
        echo $2 >> $OUTPUT_FILE
    done
}

if [[ "${#@}" -eq "5" ]]; then
    pink_count=$1
    brown_count=$2
    laplace_count=$3
    uniform_count=$4
    exponential_count=$5
elif [[ "${#@}" -eq "1" ]]; then
    pink_count=$1
    brown_count=$1
    laplace_count=$1
    uniform_count=$1
    exponential_count=$1
else
    print_usage
fi

echo 'Compiling signal generators with gcc...'
make all
cd out

rm -f "$OUTPUT_FILE"

echo "Generating $pink_count sample(s) with pinkgen..."
execute "./pinkgen 10 $SAMPLE_LENGTH 1.0" 1 $pink_count

echo "Generating $brown_count sample(s) with brownrv..."
execute "./brownrv $SAMPLE_LENGTH 0.0 1.0" 2 $brown_count

echo "Generating $laplace_count sample(s) with laplace..."
execute "./laplace $SAMPLE_LENGTH 0.0 1.0" 3 $laplace_count

echo "Generating $uniform_count sample(s) with uniformrv..."
execute "./uniformrv $SAMPLE_LENGTH -1.0 1.0" 4 $uniform_count

echo "Generating $exponential_count sample(s) with exponentialrv..."
execute "./exponentialrv $SAMPLE_LENGTH 1.0" 5 $exponential_count

wc -l "$OUTPUT_FILE"