# Article 7: Deploy Web Servers with Terraform: EC2 + Load Balancer Tutorial

## Overview
This article teaches you how to deploy high-availability web infrastructure using Terraform with EC2 instances and an Application Load Balancer.

## What You'll Build
- VPC with public subnet
- 2 EC2 instances running Apache web server
- Application Load Balancer distributing traffic
- Security groups for layered security
- Automated server configuration with user data

## Prerequisites
- Terraform installed (v1.0+)
- AWS CLI configured
- SSH key pair in AWS
- Basic understanding of VPC (Article 6)

## Quick Start

```bash
# Clone the repository
cd articles/07-ec2-load-balancer/terraform

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Deploy infrastructure
terraform apply

# Get the load balancer URL
terraform output alb_url

# Clean up
terraform destroy
```

## Architecture

```
Internet
    ↓
Application Load Balancer
    ↓
    ├─→ EC2 Instance 1 (Apache)
    └─→ EC2 Instance 2 (Apache)
```

## Key Features
- **High Availability:** Multiple instances behind load balancer
- **Auto Configuration:** User data installs and configures Apache
- **Health Checks:** Automatic monitoring and traffic routing
- **Security:** Layered security groups
- **Scalability:** Easy to add more instances

## Files
- `main.tf` - Main infrastructure code
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values

## Resources Created
- 1 VPC
- 1 Internet Gateway
- 1 Public Subnet
- 1 Route Table
- 2 Security Groups
- 2 EC2 Instances
- 1 Application Load Balancer
- 1 Target Group
- 1 ALB Listener

## Estimated Cost
- **With Free Tier:** ~$16/month (ALB only)
- **Without Free Tier:** ~$33/month

## Testing
1. Get ALB URL: `terraform output alb_url`
2. Open in browser
3. Refresh multiple times to see load balancing
4. Each refresh may show different server

## Troubleshooting
- **503 Error:** Wait 2-3 minutes for instances to boot and health checks to pass
- **Can't SSH:** Update `my_ip` variable with your IP address
- **Key Pair Error:** Create SSH key pair in AWS first

## Next Steps
- Add RDS database (Article 8)
- Implement auto-scaling
- Add HTTPS with ACM certificate
- Deploy to multiple availability zones

## Learn More
- [Full Article](../article.md)
- [GitHub Repository](https://github.com/simplynadaf/terraform-by-sarvar)
- [Author: Sarvar Nadaf](https://sarvarnadaf.com)
