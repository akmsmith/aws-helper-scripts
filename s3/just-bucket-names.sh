#!/bin/sh
# Get bucket names
aws s3 ls --profile $awsprofile | awk '{print $3}'
