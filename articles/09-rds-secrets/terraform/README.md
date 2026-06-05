# Article 8: RDS + Secrets Manager - Terraform Code

Secure database deployment with automated credential management.

## Quick Start

```bash
# 1. Initialize
terraform init

# 2. Review plan
terraform plan

# 3. Deploy (takes 5-10 minutes for RDS)
terraform apply

# 4. Get outputs
terraform output ec2_public_ip
terraform output rds_endpoint
terraform output secret_arn

# 5. Connect to EC2
ssh -i my-key.pem ec2-user@$(terraform output -raw ec2_public_ip)

# 6. On EC2, connect to database
./connect-db.sh

# 7. Clean up
terraform destroy
```

## What Gets Created

- **VPC:** 10.0.0.0/16
- **Public Subnet:** 10.0.1.0/24
- **Private Subnets:** 10.0.11.0/24, 10.0.12.0/24
- **RDS MySQL:** db.t3.micro, 20GB storage
- **Secrets Manager:** Encrypted credentials
- **EC2:** t2.micro with IAM role

## Key Features

### 1. Secure Password Management
```hcl
resource "random_password" "db_password" {
  length  = 16
  special = true
}
```
No hardcoded passwords!

### 2. Secrets Manager Integration
```hcl
resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
    host     = aws_db_instance.main.address
  })
}
```

### 3. IAM Role for EC2
```hcl
resource "aws_iam_role_policy" "secrets_access" {
  policy = jsonencode({
    Action   = ["secretsmanager:GetSecretValue"]
    Resource = aws_secretsmanager_secret.db_credentials.arn
  })
}
```

## Testing Database Connection

### From EC2 Instance

```bash
# View connection info
cat db-info.txt

# Connect to database
./connect-db.sh

# Run SQL commands
mysql> SHOW DATABASES;
mysql> CREATE TABLE test (id INT, name VARCHAR(50));
mysql> INSERT INTO test VALUES (1, 'Hello Terraform');
mysql> SELECT * FROM test;
```

### From Local Machine

```bash
# Get secret value
aws secretsmanager get-secret-value \
  --secret-id $(terraform output -raw secret_arn) \
  --query SecretString \
  --output text | jq .

# Check RDS status
aws rds describe-db-instances \
  --db-instance-identifier terraform-db-db
```

## Customization

Edit `terraform.tfvars`:

```hcl
# Change database size
db_instance_class = "db.t3.small"
db_allocated_storage = 50

# Change backup retention
# (edit main.tf)
backup_retention_period = 14

# Enable Multi-AZ
# (edit main.tf)
multi_az = true
```

## Security Best Practices

✅ **Implemented:**
- Random password generation
- Secrets Manager encryption
- Private subnet isolation
- IAM role-based access
- Storage encryption
- Automated backups
- Security group restrictions

🔒 **For Production:**
- Enable Multi-AZ
- Use larger instance class
- Increase backup retention
- Enable deletion protection
- Implement secret rotation
- Use VPN or PrivateLink for access

## Cost Optimization

**Free Tier (First 12 Months):**
- 750 hours/month db.t3.micro
- 750 hours/month t2.micro
- 20 GB storage
- **Cost: ~$1.35/month**

**After Free Tier:**
- **Cost: ~$24.56/month**

**To Reduce Costs:**
1. Use smaller storage (10 GB minimum)
2. Reduce backup retention (1 day)
3. Delete when not in use
4. Use Aurora Serverless for variable workloads

## Troubleshooting

**RDS takes long to create:**
- Normal! RDS provisioning takes 5-10 minutes
- Check status: `aws rds describe-db-instances`

**Can't connect to database:**
- Wait for RDS status to be "available"
- Check security group allows EC2 → RDS
- Verify EC2 is in same VPC

**Access denied to Secrets Manager:**
- Check IAM role is attached to EC2
- Verify policy allows GetSecretValue
- Check secret ARN in policy

**mysql command not found:**
- Wait for user data to complete (2-3 minutes)
- Check logs: `sudo cat /var/log/cloud-init-output.log`

## Next Steps

See the [full article](../article.md) for:
- Detailed explanations
- Security best practices
- Production recommendations
- Advanced configurations
