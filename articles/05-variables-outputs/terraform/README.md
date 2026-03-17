# Article 5: Variables and Outputs - Terraform Code

This folder contains the Terraform code for Article 5 of the Terraform Series.

## Files

- `main.tf` - Main resource definitions
- `variables.tf` - Variable declarations
- `outputs.tf` - Output definitions
- `terraform.tfvars` - Default variable values (auto-loaded)
- `dev.tfvars` - Development environment configuration
- `prod.tfvars` - Production environment configuration

## Quick Start

### Using Default Configuration
```bash
terraform init
terraform apply
```

### Using Dev Environment
```bash
terraform apply -var-file="dev.tfvars"
```

### Using Prod Environment
```bash
terraform apply -var-file="prod.tfvars"
```

### View Outputs
```bash
terraform output
terraform output bucket_name
terraform output -json
```

## What Gets Created

- 1 main S3 bucket (configured via variables)
- 2-3 additional S3 buckets (based on bucket_count)
- Optional versioning (based on enable_versioning)
- Tags (based on common_tags variable)

## Cleanup

```bash
terraform destroy -var-file="dev.tfvars"
# or
terraform destroy -var-file="prod.tfvars"
```

## Cost

All resources are in AWS Free Tier (S3 buckets are free to create).
