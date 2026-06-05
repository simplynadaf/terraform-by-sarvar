# Article 9: AWS IAM Roles with Terraform: Security Best Practices

## Overview
Learn how to implement secure AWS IAM roles and policies with Terraform, following security best practices and avoiding access keys.

## What You'll Build
- IAM roles for EC2 and Lambda
- Custom IAM policies with least privilege
- S3 bucket with resource-based policy
- Instance profile for EC2
- Automated permission testing

## Key Features
- **No Access Keys:** Use IAM roles instead
- **Least Privilege:** Minimum required permissions
- **Separate Roles:** Different roles for different services
- **Managed Policies:** AWS-maintained policies
- **Bucket Policies:** Resource-based access control
- **Encryption Enforcement:** Deny unencrypted uploads

## Prerequisites
- Terraform installed (v1.0+)
- AWS CLI configured
- SSH key pair in AWS
- Understanding of AWS permissions

## Quick Start

```bash
cd articles/09-iam-security/terraform

# Update s3_bucket_name in terraform.tfvars to be unique

terraform init
terraform apply

# Get EC2 IP
terraform output ec2_public_ip

# SSH and test
ssh -i my-key.pem ec2-user@<EC2_IP>
./test-s3.sh
./show-iam-info.sh

# Cleanup
terraform destroy
```

## Architecture

```
EC2 Instance (IAM Role)
    ├─→ S3 Bucket (Read/Write)
    ├─→ CloudWatch (Metrics/Logs)
    └─→ SSM (Session Manager)

Lambda Function (IAM Role)
    └─→ S3 Bucket (Read Only)
```

## Resources Created
- 2 IAM Roles (EC2, Lambda)
- 2 Custom IAM Policies
- 3 Managed Policy Attachments
- 1 Instance Profile
- 1 S3 Bucket with Policy
- 1 EC2 Instance
- 1 Security Group

## Estimated Cost
- **IAM:** $0.00 (Free)
- **S3:** $0.00 (Free tier)
- **EC2:** $8.50/month or Free tier
- **Total:** ~$0-8.50/month

## Security Features
- ✅ No hardcoded access keys
- ✅ Automatic credential rotation
- ✅ Least privilege access
- ✅ Separate roles per service
- ✅ Encryption enforcement
- ✅ CloudTrail audit trail

## Testing
1. SSH to EC2 instance
2. Run `./show-iam-info.sh` to see IAM role
3. Run `./test-s3.sh` to test S3 access
4. Try denied actions to verify least privilege

## Learn More
- [Full Article](../article.md)
- [GitHub Repository](https://github.com/simplynadaf/terraform-by-sarvar)
- [Author: Sarvar Nadaf](https://sarvarnadaf.com)
