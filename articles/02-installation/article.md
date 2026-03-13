# Article 2: Installing Terraform and Setting Up Your Environment

## What You'll Learn
- Install Terraform on Linux (Ubuntu/Amazon Linux)
- Install AWS CLI
- Configure AWS credentials
- Verify your setup
- Set up VS Code for Terraform development

---

## Prerequisites
- A Linux server or local machine (Ubuntu 20.04+ or Amazon Linux 2)
- AWS account with IAM user credentials
- Basic command line knowledge

---

## Step 1: Install Terraform

### For Ubuntu/Debian
```bash
# Update package list
sudo apt-get update

# Install required packages
sudo apt-get install -y gnupg software-properties-common wget

# Add HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install Terraform
sudo apt-get update
sudo apt-get install -y terraform
```

### For Amazon Linux 2
```bash
# Install yum-config-manager
sudo yum install -y yum-utils

# Add HashiCorp repository
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# Install Terraform
sudo yum -y install terraform
```

### Verify Installation
```bash
terraform version
```

**Expected Output:**
```
Terraform v1.14.x
on linux_amd64
```

---

## Step 2: Install AWS CLI

### For Ubuntu/Debian
```bash
# Download AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Install unzip if not present
sudo apt-get install -y unzip

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Clean up
rm -rf aws awscliv2.zip
```

### For Amazon Linux 2
```bash
# Download and install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip
```

### Verify Installation
```bash
aws --version
```

**Expected Output:**
```
aws-cli/2.x.x Python/3.x.x Linux/x.x.x
```

---

## Step 3: Create IAM User for Terraform

### In AWS Console:
1. Go to IAM → Users → Create User
2. Username: `terraform` (or your preferred name)
3. Select "Provide user access to the AWS Management Console" (optional)
4. Attach policies: `AdministratorAccess` (for learning; use restricted policies in production)
5. Create user
6. Go to Security Credentials → Create Access Key
7. Select "Command Line Interface (CLI)"
8. Download or copy:
   - Access Key ID
   - Secret Access Key

**⚠️ Important:** Never share or commit these credentials to version control!

---

## Step 4: Configure AWS Credentials

```bash
aws configure
```

**You'll be prompted for:**
```
AWS Access Key ID [None]: <YOUR_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_SECRET_ACCESS_KEY>
Default region name [None]: us-east-1
Default output format [None]: json
```

### Verify Configuration
```bash
aws sts get-caller-identity
```

**Expected Output:**
```json
{
    "UserId": "AIDASRZSGHJSDC6XXXXX",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform"
}
```

---

## Step 5: Set Up Your Working Directory

```bash
# Create project directory
mkdir -p ~/terraform-projects
cd ~/terraform-projects

# Create your first project folder
mkdir my-first-terraform
cd my-first-terraform
```

---

## Step 6: (Optional) Install VS Code with Terraform Extension

### Install VS Code
```bash
# Ubuntu/Debian
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
```

### Install Terraform Extension
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "HashiCorp Terraform"
4. Click Install

**Extension Features:**
- Syntax highlighting
- Auto-completion
- Formatting (terraform fmt)
- Validation

---

## Step 7: Test Your Setup

Create a simple test file:

```bash
cat > test.tf << 'EOF'
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

# This is just a test - we won't create any resources yet
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "aws_caller_identity" "current" {}
EOF
```

**Run Terraform commands:**
```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# See what would happen (no resources created)
terraform plan
```

**Expected Output:**
```
Terraform has been successfully initialized!
Success! The configuration is valid.
Changes to Outputs:
  + account_id = "123456789012"
```

**Clean up test file:**
```bash
rm test.tf
rm -rf .terraform .terraform.lock.hcl
```

---

## Troubleshooting Common Issues

### Issue 1: "terraform: command not found"
**Solution:** Add Terraform to PATH or reinstall

### Issue 2: "Unable to locate credentials"
**Solution:** Run `aws configure` again and verify credentials

### Issue 3: "Error: No valid credential sources found"
**Solution:** Check `~/.aws/credentials` file exists and has correct format

### Issue 4: Permission denied errors
**Solution:** Verify IAM user has necessary permissions

---

## What's Next?

In the next article, we'll:
- Create our first AWS resource (S3 bucket)
- Understand Terraform workflow (init, plan, apply, destroy)
- Learn about Terraform state
- Explore basic Terraform syntax

---

## Key Takeaways

✅ Terraform is installed and working
✅ AWS CLI is configured with credentials
✅ You can verify your AWS identity
✅ Your development environment is ready
✅ You understand the basic Terraform commands

---

## Additional Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## Screenshots Needed
1. [ ] Terraform version output
2. [ ] AWS CLI version output
3. [ ] aws configure prompts
4. [ ] aws sts get-caller-identity output
5. [ ] terraform init output
6. [ ] terraform validate output
7. [ ] VS Code with Terraform extension (optional)

---

**Next Article:** [Part 3: Provisioning Your First AWS Resource](#)
