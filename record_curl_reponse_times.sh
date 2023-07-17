#!/bin/bash

echo "curl-time" > curl_time.csv

for i in {1..100}; do
    rm -rf http.bala | true
    start=$(date +%s.%N)
    # This is an expiring link. Replace it with a valid link.
    curl https://fileserver.dev-central.ballerina.io/2.0/ballerina/http/2.9.0/ballerina-http-java11-2.9.0.bala\?md5\=9smFpLv-PoV3iHNRe7rhbg\&expires\=1689412987 --output http.bala
    end=$(date +%s.%N)
    runtime=$(echo "$end - $start" | bc -l)
    echo $runtime
    echo $runtime >> curl_time.csv
done   

