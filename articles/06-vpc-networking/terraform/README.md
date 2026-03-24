# Article 6: VPC Networking - Terraform Code

This directory contains the Terraform code for Article 6: Building a VPC with Terraform.

## What This Code Creates

- **VPC** with CIDR 10.0.0.0/16
- **2 Public Subnets** (10.0.1.0/24, 10.0.2.0/24) in different AZs
- **2 Private Subnets** (10.0.11.0/24, 10.0.12.0/24) in different AZs
- **Internet Gateway** for public subnet internet access
- **NAT Gateway** for private subnet outbound internet access
- **Elastic IP** for NAT Gateway
- **Route Tables** (public and private) with proper routes
- **Route Table Associations** for all subnets

## Architecture

```
VPC (10.0.0.0/16)
├── Public Subnet 1 (10.0.1.0/24) - us-east-1a
│   └── Route: 0.0.0.0/0 → Internet Gateway
├── Public Subnet 2 (10.0.2.0/24) - us-east-1b
│   └── Route: 0.0.0.0/0 → Internet Gateway
├── Private Subnet 1 (10.0.11.0/24) - us-east-1a
│   └── Route: 0.0.0.0/0 → NAT Gateway
└── Private Subnet 2 (10.0.12.0/24) - us-east-1b
    └── Route: 0.0.0.0/0 → NAT Gateway
```

## Files

- `main.tf` - Main infrastructure code
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values

## Usage

```bash
# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply

# View outputs
terraform output

# Destroy (IMPORTANT: NAT Gateway costs money!)
terraform destroy
```

## Cost Warning ⚠️

**NAT Gateway costs approximately $32/month ($0.045/hour)**

Always destroy resources after testing:
```bash
terraform destroy -auto-approve
```

## Customization

Edit `terraform.tfvars` to change:
- Region
- Project name
- Environment
- CIDR blocks

## Next Steps

In Article 7, we'll deploy EC2 instances and a load balancer in this VPC!
