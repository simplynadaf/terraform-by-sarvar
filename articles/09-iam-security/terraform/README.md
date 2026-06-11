# Article 9: IAM Security - Terraform Code

Secure IAM implementation with roles, policies, and best practices.

## Quick Start

```bash
# 1. Update bucket name in terraform.tfvars
# Must be globally unique!
s3_bucket_name = "your-unique-bucket-name-2026"

# 2. Initialize
terraform init

# 3. Deploy
terraform apply

# 4. Test IAM permissions
ssh -i my-key.pem ec2-user@$(terraform output -raw ec2_public_ip)

# On EC2:
./show-iam-info.sh  # View IAM role info
./test-s3.sh        # Test S3 access

# 5. Cleanup
terraform destroy
```

## What Gets Created

### IAM Resources
- **EC2 Role:** With S3, CloudWatch, and SSM access
- **Lambda Role:** With S3 read-only access
- **Custom Policies:** Least privilege S3 access
- **Instance Profile:** Attaches role to EC2

### Other Resources
- **S3 Bucket:** With encryption enforcement policy
- **EC2 Instance:** With IAM role attached
- **Security Group:** SSH access only

## IAM Architecture

### EC2 Role Permissions
```
EC2 Instance
  ├─ Custom S3 Policy (Read/Write to specific bucket)
  ├─ CloudWatchAgentServerPolicy (Metrics/Logs)
  └─ AmazonSSMManagedInstanceCore (Session Manager)
```

### Lambda Role Permissions
```
Lambda Function
  ├─ AWSLambdaBasicExecutionRole (CloudWatch Logs)
  └─ Custom S3 Read Policy (Read from specific bucket)
```

## Key Security Features

### 1. No Access Keys
```hcl
# ❌ Bad - Don't do this
resource "aws_iam_access_key" "bad" {
  user = aws_iam_user.user.name
}

# ✅ Good - Use IAM roles
resource "aws_iam_role" "good" {
  assume_role_policy = jsonencode({...})
}
```

### 2. Least Privilege
```hcl
# Only specific actions on specific resources
policy = jsonencode({
  Action   = ["s3:GetObject", "s3:PutObject"]  # Not s3:*
  Resource = ["arn:aws:s3:::specific-bucket/*"] # Not *
})
```

### 3. Encryption Enforcement
```hcl
# Bucket policy denies unencrypted uploads
{
  Effect = "Deny"
  Condition = {
    StringNotEquals = {
      "s3:x-amz-server-side-encryption" = "AES256"
    }
  }
}
```

## Testing Permissions

### Test Allowed Actions
```bash
# Should succeed
aws s3 ls s3://YOUR-BUCKET/
aws s3 cp test.txt s3://YOUR-BUCKET/
aws cloudwatch put-metric-data --namespace Test --metric-name Test --value 1
```

### Test Denied Actions
```bash
# Should fail (least privilege working!)
aws s3 ls                              # Can't list all buckets
aws s3 cp test.txt s3://OTHER-BUCKET/  # Can't access other buckets
aws ec2 describe-instances             # No EC2 permissions
```

### View IAM Role Info
```bash
# From EC2 instance
curl http://169.254.169.254/latest/meta-data/iam/info
aws sts get-caller-identity
```

## Customization

### Add More Permissions
```hcl
resource "aws_iam_role_policy_attachment" "additional" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
}
```

### Restrict by IP
```hcl
policy = jsonencode({
  Condition = {
    IpAddress = {
      "aws:SourceIp" = "203.0.113.0/24"
    }
  }
})
```

### Add MFA Requirement
```hcl
Condition = {
  BoolIfExists = {
    "aws:MultiFactorAuthPresent" = "true"
  }
}
```

## Common IAM Patterns

### Pattern 1: Service-to-Service Access
```hcl
# Lambda accessing DynamoDB
resource "aws_iam_role_policy_attachment" "lambda_dynamodb" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
```

### Pattern 2: Cross-Account Access
```hcl
assume_role_policy = jsonencode({
  Principal = {
    AWS = "arn:aws:iam::OTHER-ACCOUNT:root"
  }
})
```

### Pattern 3: Time-Based Access
```hcl
Condition = {
  DateGreaterThan = {
    "aws:CurrentTime" = "2026-01-01T00:00:00Z"
  }
}
```

## Troubleshooting

**Access Denied:**
```bash
# Check role is attached
aws ec2 describe-instances --instance-ids <ID> \
  --query 'Reservations[0].Instances[0].IamInstanceProfile'

# Check policies
aws iam list-attached-role-policies --role-name terraform-iam-ec2-role
```

**No Credentials:**
```bash
# Verify instance profile
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
```

**Policy Syntax Error:**
```bash
# Validate JSON
cat policy.json | jq .
```

## Security Best Practices

✅ **Implemented:**
- No access keys
- Least privilege
- Separate roles per service
- Managed policies where possible
- Resource-based policies
- Encryption enforcement

🔒 **For Production:**
- Add permission boundaries
- Enable MFA for sensitive actions
- Use SCPs for organization limits
- Regular access reviews
- Enable CloudTrail logging
- Use AWS IAM Access Analyzer

## Cost
- **IAM is completely FREE**
- No charge for roles, policies, or users
- Only pay for resources (EC2, S3)

## Next Steps

See the [full article](../article.md) for:
- Detailed IAM concepts
- Security best practices
- Advanced policy examples
- Troubleshooting guide
