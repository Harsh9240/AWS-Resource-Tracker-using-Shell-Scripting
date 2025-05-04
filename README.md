# 🚀 AWS Resource Tracker using Shell Scripting

This project is a lightweight automation tool built with Bash and AWS CLI to track and report usage of key AWS resources including EC2 instances, S3 buckets, and Lambda functions. The script is scheduled via `crontab` to run daily and log output for easy monitoring.

---

## 📌 Features

- ✅ Lists all S3 buckets in the AWS account  
- ✅ Fetches current EC2 instance information  
- ✅ Retrieves all deployed AWS Lambda functions  
- ✅ Logs output to a file for auditing and reporting  
- ✅ Automated daily execution using `crontab`  

---

## 🛠️ Technologies Used

- Bash (Shell Scripting)  
- AWS CLI  
- Crontab (Linux Scheduler)  
- EC2, S3, Lambda  

---

## 📂 Script Overview

```bash
#!/bin/bash

###########
# Author: Harsh
# Date: 4th May
#
# This script reports AWS resource usage
###########

set -x

LOG_FILE="/home/harsh/aws_resource_report.log"

echo "Listing S3 buckets" >> $LOG_FILE
aws s3 ls >> $LOG_FILE 2>&1

echo "Listing EC2 instances" >> $LOG_FILE
aws ec2 describe-instances --output table >> $LOG_FILE 2>&1

echo "Listing Lambda functions" >> $LOG_FILE
aws lambda list-functions --output table >> $LOG_FILE 2>&1
