#!/bin/bash

echo "build-time" > build_time.csv
export BALLERINA_DEV_CENTRAL=true

for i in {1..100}; do
    rm -rf $BALLERINA_PACKAGE_CACHE_PATH | true
    start=$(date +%s.%N)
    bal build
    end=$(date +%s.%N)
    runtime=$(echo "$end - $start" | bc -l)
    echo $runtime
    echo $runtime >> build_time.csv
done   

