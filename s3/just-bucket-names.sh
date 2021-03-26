#!/bin/sh
# Get bucket names
aws s3 ls | awk '{print $3}'