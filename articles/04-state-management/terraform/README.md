# Article 4: Understanding Terraform State - Code Examples

This directory contains the Terraform code used in Article 4.

## Files

- `main.tf` - Main configuration with 2 S3 buckets for state management demonstration

## Usage

```bash
# Initialize
terraform init

# Create resources
terraform apply

# Test state commands
terraform state list
terraform state show aws_s3_bucket.logs
terraform state pull

# Import existing resource (after manual creation)
terraform import aws_s3_bucket.manual manual-bucket-yourname-2026

# Cleanup
terraform destroy
```

## Resources Created

- `aws_s3_bucket.logs` - Application logs bucket
- `aws_s3_bucket.backups` - Application backups bucket
- `aws_s3_bucket.manual` - Manually created bucket (imported)

## Important Notes

- Change bucket names to be globally unique
- Never commit terraform.tfstate to Git
- Always backup state before major operations
- Use state commands instead of manual edits

## Article Link

[Understanding Terraform State: Your Infrastructure's Memory](#)
