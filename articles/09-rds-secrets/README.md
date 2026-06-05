# Article 8: Secure Database Deployment: RDS + Secrets Manager with Terraform

## Overview
Learn how to deploy RDS MySQL database with AWS Secrets Manager for secure credential management using Terraform.

## What You'll Build
- VPC with public and private subnets
- RDS MySQL database in private subnets
- AWS Secrets Manager for credentials
- EC2 instance with IAM role for secure access
- Automated database connection setup
- Encrypted storage and backups

## Key Features
- **No Hardcoded Passwords:** Auto-generated and stored securely
- **Private Database:** RDS in private subnets, not internet-accessible
- **IAM Roles:** No access keys needed on EC2
- **Encryption:** At rest and in transit
- **Automated Backups:** 7-day retention
- **CloudWatch Logs:** Error and slow query logging

## Prerequisites
- Terraform installed (v1.0+)
- AWS CLI configured
- SSH key pair in AWS
- Understanding of VPC and security groups

## Quick Start

```bash
# Navigate to terraform directory
cd articles/08-rds-secrets/terraform

# Initialize
terraform init

# Deploy (takes 5-10 minutes)
terraform apply

# Get EC2 IP
terraform output ec2_public_ip

# SSH and connect to database
ssh -i my-key.pem ec2-user@<EC2_IP>
./connect-db.sh

# Clean up
terraform destroy
```

## Architecture

```
Internet
    ↓
EC2 (Public Subnet)
    ↓ (IAM Role)
    ├─→ Secrets Manager (Get Credentials)
    └─→ RDS MySQL (Private Subnets)
```

## Resources Created
- 1 VPC
- 3 Subnets (1 public, 2 private)
- 2 Security Groups
- 1 RDS MySQL Instance
- 1 Secrets Manager Secret
- 1 IAM Role + Policy
- 1 EC2 Instance

## Estimated Cost
- **With Free Tier:** ~$1.35/month
- **Without Free Tier:** ~$24.56/month

## Security Features
- ✅ Random password generation
- ✅ Encrypted credential storage
- ✅ Private subnet isolation
- ✅ IAM role-based access
- ✅ Storage encryption at rest
- ✅ Automated backups
- ✅ CloudWatch logging

## Testing
1. SSH to EC2 instance
2. Run `./connect-db.sh`
3. Execute SQL commands
4. Verify Secrets Manager integration

## Learn More
- [Full Article](../article.md)
- [GitHub Repository](https://github.com/simplynadaf/terraform-by-sarvar)
- [Author: Sarvar Nadaf](https://sarvarnadaf.com)
