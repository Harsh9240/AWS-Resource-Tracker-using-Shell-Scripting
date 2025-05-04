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




🕒 Scheduling with Crontab
To schedule the script to run daily at 6:00 AM:

bash
Copy
Edit
crontab -e
Add the following line:

bash
Copy
Edit
0 6 * * * /home/harsh/aws_resource_tracker >> /home/harsh/aws_cron.log 2>&1
✅ How to Use
Make sure AWS CLI is installed and configured (aws configure)

Save the script as /home/harsh/aws_resource_tracker

Give it execution permission:

bash
Copy
Edit
chmod +x /home/harsh/aws_resource_tracker
(Optional) Run manually to test:

bash
Copy
Edit
/home/harsh/aws_resource_tracker
📌 Output Example
pgsql
Copy
Edit
Listing S3 buckets
2025-05-01  bucket-name-example

Listing EC2 instances
-----------------------------------------------------
|                DescribeInstances                  |
+---------------------------------------------------+
|               InstanceId | InstanceType | State   |
|  i-0123456789abcdef0     | t2.micro     | running |

Listing Lambda functions
-----------------------------------------------------
|                   ListFunctions                   |
+---------------------------------------------------+
|   FunctionName | Runtime | LastModified           |
|   my-function  | python3.9 | 2025-05-01T05:00:00Z  |
