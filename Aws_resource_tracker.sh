#!/bin/bash

########################################
# Author: Harsh
# Date: 4th May
# Description: This script reports AWS resource usage:
#   - S3 Buckets
#   - EC2 Instances
#   - Lambda Functions
#   - IAM Users
########################################

set -x  # Enable debug output

# List S3 buckets
echo "========== S3 Buckets =========="
aws s3 ls

# List EC2 instances
echo "========== EC2 Instances =========="
aws ec2 describe-instances

# List Lambda functions
echo "========== Lambda Functions =========="
aws lambda list-functions

# List IAM users
echo "========== IAM Users =========="
aws iam list-users
