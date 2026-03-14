# Article 3: Your First Terraform Resource

This code creates your first AWS resource - an S3 bucket.

## What This Does

- Creates an S3 bucket in AWS
- Adds tags for organization
- Outputs bucket information

## How to Use

```bash
# Navigate to this directory
cd articles/03-first-resource/terraform

# Initialize Terraform
terraform init

# Preview what will be created
terraform plan

# Create the S3 bucket
terraform apply

# When done, destroy the bucket
terraform destroy
```

## Important Notes

⚠️ **Change the bucket name!** S3 bucket names must be globally unique. Replace `terraform-series-first-bucket-2026` with your own unique name.

## What You'll Learn

- The 4 core Terraform commands (init, plan, apply, destroy)
- How to create AWS resources with code
- Understanding Terraform state files
- Basic HCL syntax

## Cost

S3 buckets are free tier eligible. This will cost $0 if you destroy it after testing.

## Troubleshooting

**Bucket name already exists:**
```hcl
bucket = "terraform-series-first-bucket-yourname-12345"
```

**Invalid bucket name:**
- Use only lowercase letters, numbers, and hyphens
- Must be 3-63 characters
- No uppercase or underscores
