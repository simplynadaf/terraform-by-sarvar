# Article 2: Installation Verification

This code verifies your Terraform and AWS setup is working correctly.

## What This Does

- Checks Terraform can connect to AWS
- Displays your AWS account information
- Verifies AWS credentials are configured properly

## How to Use

```bash
# Navigate to this directory
cd articles/02-installation/terraform

# Initialize Terraform
terraform init

# Run the verification
terraform plan

# Apply to see your AWS account details
terraform apply
```

## Expected Output

You should see:
- Your AWS Account ID
- Your AWS User ARN
- Your AWS Region

## No Resources Created

This code only reads information - it doesn't create any AWS resources, so it's completely safe and free!

## Troubleshooting

If you get errors:
- Check AWS credentials: `aws configure`
- Verify AWS CLI works: `aws sts get-caller-identity`
- Ensure you have internet connection
