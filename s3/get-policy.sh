#!/bin/sh
# Get lifecycles for S3 buckets

FILENAME="buckets.txt"

buckets=$(cat $FILENAME)

for LINE in $buckets
do
    aws s3api get-bucket-lifecycle-configuration --profile $awsprofile --bucket $LINE > $LINE.json
done