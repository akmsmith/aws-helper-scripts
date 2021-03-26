#!/bin/sh
# Set lifecycles for S3 buckets

FILENAME="buckets.txt"
POLICY="policy.json"

buckets=$(cat $FILENAME)

for LINE in $buckets
do
aws s3api put-bucket-lifecycle-configuration --bucket $LINE --lifecycle-configuration  file://$POLICY

done