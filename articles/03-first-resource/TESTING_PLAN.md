# Article 3: Your First AWS Resource - Testing Plan

## 🎯 Objective
Create an S3 bucket using Terraform while teaching the complete workflow

## 📝 What to Cover

### 1. Quick Theory (5 minutes)
- What is a .tf file
- Terraform workflow: init → plan → apply → destroy
- What is state file
- Basic HCL syntax

### 2. Hands-On: Create S3 Bucket (15 minutes)
- Write main.tf
- Run terraform init
- Run terraform plan
- Run terraform apply
- Verify in AWS Console
- Run terraform destroy

### 3. Deep Dive (10 minutes)
- File structure explained
- State file deep dive
- Provider configuration details
- Resource naming conventions

## 🧪 Testing Steps

### Step 1: Create main.tf
```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "terraform-series-first-bucket-[UNIQUE-ID]"
  
  tags = {
    Name        = "My First Terraform Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.my_first_bucket.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.my_first_bucket.arn
  description = "The ARN of the S3 bucket"
}
```

### Step 2: Test Commands

1. **terraform init**
   - [SCREENSHOT NEEDED: init output]
   - Verify .terraform/ folder created
   - Verify .terraform.lock.hcl created

2. **terraform validate**
   - [SCREENSHOT NEEDED: validation success]

3. **terraform fmt**
   - [SCREENSHOT NEEDED: formatting output]

4. **terraform plan**
   - [SCREENSHOT NEEDED: plan showing 1 resource to add]
   - Note the + signs
   - Note the resource details

5. **terraform apply**
   - [SCREENSHOT NEEDED: apply prompt]
   - Type "yes"
   - [SCREENSHOT NEEDED: apply complete with outputs]

6. **Verify in AWS Console**
   - [SCREENSHOT NEEDED: S3 Console showing bucket]
   - [SCREENSHOT NEEDED: Bucket tags]

7. **Check state file**
   - [SCREENSHOT NEEDED: terraform.tfstate content]
   - Explain what's stored

8. **terraform show**
   - [SCREENSHOT NEEDED: show output]

9. **terraform destroy**
   - [SCREENSHOT NEEDED: destroy plan]
   - Type "yes"
   - [SCREENSHOT NEEDED: destroy complete]

10. **Verify deletion**
    - [SCREENSHOT NEEDED: S3 Console empty]

## 📸 Screenshots Required

Total: ~12 screenshots

1. terraform init output
2. .terraform folder structure
3. terraform validate success
4. terraform fmt output
5. terraform plan output
6. terraform apply prompt
7. terraform apply complete with outputs
8. AWS S3 Console showing bucket
9. Bucket tags in console
10. terraform.tfstate file content
11. terraform destroy plan
12. terraform destroy complete

## 🐛 Potential Issues to Test

1. Bucket name already exists (test with duplicate)
2. Invalid bucket name (test with uppercase)
3. Missing AWS credentials
4. Wrong region
5. Permission issues

## 🗑️ Cleanup Commands

```bash
cd "/home/ubuntu/Terraform Series/articles/03-first-resource/terraform"
terraform destroy -auto-approve
rm -rf .terraform .terraform.lock.hcl terraform.tfstate*
```

## ✅ Testing Checklist

- [ ] Code written in terraform/ folder
- [ ] terraform init works
- [ ] terraform validate works
- [ ] terraform plan shows correct changes
- [ ] terraform apply creates bucket
- [ ] Bucket visible in AWS Console
- [ ] Outputs display correctly
- [ ] State file created
- [ ] terraform destroy removes bucket
- [ ] No resources left in AWS
- [ ] All screenshots noted
- [ ] Error scenarios tested

## 📝 Article Structure

1. **Hook** - "Remember clicking through AWS Console? Not anymore!"
2. **Quick Theory** - Essential concepts
3. **Hands-On** - Step by step bucket creation
4. **Understanding** - Deep dive into what happened
5. **Troubleshooting** - Common issues
6. **Best Practices** - Naming, tags, organization
7. **What's Next** - Preview Article 4 (State management)

## 🔗 Links to Include

- Previous article (Installation)
- GitHub repo
- AWS S3 documentation
- Terraform AWS provider docs
- Next article preview

---

**Status:** Ready for testing
**Next Step:** Create and test Terraform code
