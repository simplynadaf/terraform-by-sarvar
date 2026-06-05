# Article 10: Going Serverless: Deploy AWS Lambda Functions with Terraform

## Overview
Learn how to deploy serverless applications using AWS Lambda, API Gateway, and S3 event triggers with Terraform.

## What You'll Build
- 2 Lambda functions (Hello API, S3 Processor)
- API Gateway REST API
- S3 bucket with event notifications
- CloudWatch Logs monitoring
- Complete serverless application

## Key Features
- **Pay Per Use:** Only pay when code runs
- **Auto Scaling:** Handles any load automatically
- **No Servers:** AWS manages everything
- **Event-Driven:** S3 triggers Lambda automatically
- **API Endpoint:** Public HTTP API

## Prerequisites
- Terraform installed (v1.0+)
- AWS CLI configured
- Basic Python knowledge

## Quick Start

```bash
cd articles/10-lambda-serverless/terraform

# Update bucket name in terraform.tfvars
terraform init
terraform apply

# Test API
curl $(terraform output -raw api_gateway_url)

# Test S3 trigger
echo "test" > test.txt
aws s3 cp test.txt s3://$(terraform output -raw s3_bucket_name)/test.txt

# View logs
aws logs tail /aws/lambda/terraform-lambda-hello --follow

# Cleanup
terraform destroy
```

## Architecture

```
Internet → API Gateway → Lambda (Hello)
S3 Bucket → Lambda (S3 Processor) → CloudWatch Logs
```

## Resources Created
- 2 Lambda Functions
- 1 IAM Role + Policies
- 1 API Gateway (REST API)
- 1 S3 Bucket with notifications
- 2 CloudWatch Log Groups

## Estimated Cost
- **With Free Tier:** $0.00
- **After Free Tier:** ~$0.005/month (10K requests)

## Lambda Functions

### Hello Function
- Simple HTTP API
- Returns JSON response
- Query parameter support

### S3 Processor
- Triggered by .txt file uploads
- Logs file information
- Processes S3 events

## Learn More
- [Full Article](../article.md)
- [GitHub Repository](https://github.com/simplynadaf/terraform-by-sarvar)
- [Author: Sarvar Nadaf](https://sarvarnadaf.com)
