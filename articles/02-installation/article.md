# Installing Terraform and Setting Up Your AWS Environment (Step-by-Step Guide)

> *"A journey of a thousand miles begins with a single step. Your Terraform journey begins with installation."*

## 🎯 Welcome Back!

In the [previous article](https://dev.to/sarvar_04/series/36958), you learned **why** Terraform is a game-changer for infrastructure management. Now it's time to get your hands dirty!

**By the end of this article, you'll have:**
- ✅ Terraform installed and working on your machine
- ✅ AWS CLI configured with your credentials
- ✅ A development environment ready for Terraform coding
- ✅ Confidence to run your first Terraform commands

**Time Required:** 30 minutes  
**Difficulty:** Beginner-friendly  
**Cost:** $0 (using AWS free tier)

Let's get started! 🚀

---

## 📋 What You'll Need

### Required ✅
- **Computer:** Linux (Ubuntu/Amazon Linux), Mac, or Windows
- **AWS Account:** [Create free account](https://aws.amazon.com/free/) (takes 5 minutes)
- **Internet Connection:** For downloading tools
- **Terminal Access:** Command line basics

### Optional 💡
- **VS Code:** For better Terraform editing experience
- **Git:** For version control (we'll use it later)

**Don't worry if you're new to this!** I'll guide you through every step with clear instructions.

---

## 🖥️ Step 1: Install Terraform

Terraform works on all major operating systems. Choose your platform below:

### 🐧 For Ubuntu/Debian Linux

```bash
# Update your package list
sudo apt-get update

# Install required packages
sudo apt-get install -y gnupg software-properties-common wget

# Add HashiCorp GPG key (for security verification)
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

**What's happening here?**
- Line 2: Updates your system's package list
- Lines 5-8: Adds HashiCorp's security key
- Lines 11-13: Adds HashiCorp's software repository
- Lines 16-17: Installs Terraform

### 🔴 For Amazon Linux 2

```bash
# Install yum-config-manager
sudo yum install -y yum-utils

# Add HashiCorp repository
sudo yum-config-manager --add-repo \
https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# Install Terraform
sudo yum -y install terraform
```

### 🍎 For macOS

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### 🪟 For Windows

**Option 1: Using Chocolatey (Recommended)**
```powershell
# Install Chocolatey (if not already installed)
# Run PowerShell as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Terraform
choco install terraform
```

**Option 2: Manual Installation**
1. Download from: https://developer.hashicorp.com/terraform/downloads
2. Extract the ZIP file
3. Add the folder to your system PATH
4. Restart your terminal

### ✅ Verify Terraform Installation

Run this command in your terminal:

```bash
terraform version
```

**Expected Output:**
```
Terraform v1.14.x
on linux_amd64
```

**🎉 Success!** If you see the version number, Terraform is installed correctly.

**❌ Troubleshooting:**
- **"terraform: command not found"** → Restart your terminal or add Terraform to PATH
- **Permission denied** → Use `sudo` or run as administrator
- **Old version showing** → Run `terraform -install-autocomplete` to update

---

## ☁️ Step 2: Install AWS CLI

AWS CLI (Command Line Interface) lets you interact with AWS services from your terminal. Terraform uses it to authenticate with AWS.

### 🐧 For Linux (Ubuntu/Amazon Linux)

```bash
# Download AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Install unzip if not present
sudo apt-get install -y unzip  # Ubuntu/Debian
# OR
sudo yum install -y unzip      # Amazon Linux

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Clean up
rm -rf aws awscliv2.zip
```

### 🍎 For macOS

```bash
# Download and install
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm AWSCLIV2.pkg
```

### 🪟 For Windows

**Download and run the installer:**
https://awscli.amazonaws.com/AWSCLIV2.msi

### ✅ Verify AWS CLI Installation

```bash
aws --version
```

**Expected Output:**
```
aws-cli/2.x.x Python/3.x.x Linux/x.x.x
```

**🎉 Great!** AWS CLI is ready.

---

## 🔐 Step 3: Create IAM User for Terraform

**Why do we need this?**  
Terraform needs permission to create AWS resources. We'll create a dedicated IAM user with programmatic access.

### In AWS Console:

**Step 3.1: Navigate to IAM**
1. Log in to [AWS Console](https://console.aws.amazon.com/)
2. Search for "IAM" in the top search bar
3. Click on "IAM" service

**Step 3.2: Create User**
1. Click **"Users"** in the left sidebar
2. Click **"Create user"** button
3. **User name:** `terraform-user` (or your preferred name)
4. Click **"Next"**

**Step 3.3: Set Permissions**
1. Select **"Attach policies directly"**
2. Search for and select: **`AdministratorAccess`**
   
   ⚠️ **Note:** We're using admin access for learning. In production, use restricted policies!

3. Click **"Next"**
4. Click **"Create user"**

**Step 3.4: Create Access Keys**
1. Click on your newly created user
2. Go to **"Security credentials"** tab
3. Scroll to **"Access keys"** section
4. Click **"Create access key"**
5. Select **"Command Line Interface (CLI)"**
6. Check the confirmation box
7. Click **"Next"**
8. (Optional) Add description: "Terraform learning"
9. Click **"Create access key"**

**Step 3.5: Save Your Credentials**

You'll see two important values:
- **Access Key ID:** `AKIAIOSFODNN7EXAMPLE`
- **Secret Access Key:** `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`

⚠️ **CRITICAL:** 
- **Download the CSV file** or copy these values NOW
- You won't be able to see the secret key again
- **NEVER share these credentials** or commit them to Git
- Treat them like passwords!

---

## 🔧 Step 4: Configure AWS Credentials

Now let's tell AWS CLI about your credentials.

### Configure AWS CLI

Run this command:

```bash
aws configure
```

**You'll be prompted for 4 values:**

```
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json
```

**What each means:**
- **Access Key ID:** Your IAM user's public identifier
- **Secret Access Key:** Your IAM user's password (keep secret!)
- **Region:** Where AWS will create resources (use `us-east-1` for free tier)
- **Output format:** How AWS CLI displays results (`json` is most common)

### ✅ Verify AWS Configuration

```bash
aws sts get-caller-identity
```

**Expected Output:**
```json
{
    "UserId": "AIDASRZSGHJSDC6XXXXX",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-user"
}
```

**🎉 Perfect!** You're authenticated with AWS.

**What this shows:**
- **UserId:** Your IAM user's unique ID
- **Account:** Your AWS account number
- **Arn:** Your user's Amazon Resource Name

**❌ Troubleshooting:**
- **"Unable to locate credentials"** → Run `aws configure` again
- **"Access Denied"** → Check your IAM user has correct permissions
- **Wrong account showing** → You might have multiple AWS profiles configured

---

## 📁 Step 5: Set Up Your Working Directory

Let's create a organized workspace for your Terraform projects.

```bash
# Create main projects directory
mkdir -p ~/terraform-projects
cd ~/terraform-projects

# Create your first project
mkdir my-first-terraform
cd my-first-terraform

# Verify you're in the right place
pwd
```

**Expected Output:**
```
/home/your-username/terraform-projects/my-first-terraform
```

**Directory Structure:**
```
~/terraform-projects/
└── my-first-terraform/     ← You are here
    └── (Terraform files will go here)
```

---

## 🧪 Step 6: Test Your Setup

Let's verify everything works together! We'll create a simple test file.

### Create Test File

```bash
cat > test.tf << 'EOF'
# Terraform configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS Provider configuration
provider "aws" {
  region = "us-east-1"
}

# Data source to get current AWS account info
data "aws_caller_identity" "current" {}

# Output to display account ID
output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "Your AWS Account ID"
}

output "user_arn" {
  value       = data.aws_caller_identity.current.arn
  description = "Your IAM User ARN"
}
EOF
```

**What this file does:**
- Defines Terraform and AWS provider versions
- Connects to AWS in us-east-1 region
- Retrieves your AWS account information
- Displays your account ID and user ARN

### Initialize Terraform

```bash
terraform init
```

**Expected Output:**
```
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.x.x...
- Installed hashicorp/aws v5.x.x

Terraform has been successfully initialized!
```

**What happened?**
- Terraform downloaded the AWS provider plugin
- Created `.terraform` directory with provider files
- Created `.terraform.lock.hcl` to lock provider versions

### Validate Configuration

```bash
terraform validate
```

**Expected Output:**
```
Success! The configuration is valid.
```

### Preview Changes

```bash
terraform plan
```

**Expected Output:**
```
data.aws_caller_identity.current: Reading...
data.aws_caller_identity.current: Read complete after 0s

Changes to Outputs:
  + account_id = "123456789012"
  + user_arn   = "arn:aws:iam::123456789012:user/terraform-user"

You can apply this plan to save these new output values to the Terraform
state, without changing any real infrastructure.
```

**What this shows:**
- ✅ Terraform can connect to AWS
- ✅ Your credentials are working
- ✅ No actual resources will be created (just outputs)

### Apply Configuration

```bash
terraform apply
```

Type `yes` when prompted.

**Expected Output:**
```
data.aws_caller_identity.current: Reading...
data.aws_caller_identity.current: Read complete after 0s

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

account_id = "123456789012"
user_arn = "arn:aws:iam::123456789012:user/terraform-user"
```

**🎉 Congratulations!** Your Terraform setup is working perfectly!

### Clean Up Test Files

```bash
# Remove test file and Terraform files
rm test.tf
rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
```

---

## 💻 Step 7: (Optional) Set Up VS Code for Terraform

VS Code makes writing Terraform code much easier with syntax highlighting, auto-completion, and validation.

### Install VS Code

**Ubuntu/Debian:**
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
```

**macOS:**
```bash
brew install --cask visual-studio-code
```

**Windows:**  
Download from: https://code.visualstudio.com/

### Install Terraform Extension

1. Open VS Code
2. Press `Ctrl+Shift+X` (or `Cmd+Shift+X` on Mac)
3. Search for **"HashiCorp Terraform"**
4. Click **"Install"**

**Extension Features:**
- ✅ Syntax highlighting
- ✅ Auto-completion
- ✅ Code formatting (`terraform fmt`)
- ✅ Validation
- ✅ Hover documentation

### Configure VS Code Settings

Create `.vscode/settings.json` in your project:

```json
{
  "terraform.languageServer.enable": true,
  "terraform.experimentalFeatures.validateOnSave": true,
  "files.associations": {
    "*.tf": "terraform",
    "*.tfvars": "terraform"
  },
  "editor.formatOnSave": true
}
```

---

## 🎓 What You've Accomplished

Let's recap what you've set up:

✅ **Terraform Installed** - Ready to write infrastructure code  
✅ **AWS CLI Configured** - Can interact with AWS services  
✅ **IAM User Created** - Secure access for Terraform  
✅ **Credentials Configured** - Terraform can authenticate with AWS  
✅ **Working Directory** - Organized project structure  
✅ **Setup Verified** - Everything tested and working  
✅ **VS Code Ready** (Optional) - Professional development environment  

**You're now ready to start creating real AWS infrastructure with Terraform!** 🚀

---

## 🐛 Common Issues & Solutions

### Issue 1: "terraform: command not found"

**Solution:**
```bash
# Check if Terraform is installed
which terraform

# If not found, reinstall or add to PATH
export PATH=$PATH:/usr/local/bin
```

### Issue 2: "Unable to locate credentials"

**Solution:**
```bash
# Reconfigure AWS CLI
aws configure

# Verify credentials file exists
cat ~/.aws/credentials
```

### Issue 3: "Error: No valid credential sources found"

**Solution:**
```bash
# Check AWS credentials are set
aws sts get-caller-identity

# If fails, reconfigure
aws configure
```

### Issue 4: "Access Denied" errors

**Solution:**
- Verify IAM user has `AdministratorAccess` policy
- Check you're using the correct AWS profile
- Ensure access keys are correct

### Issue 5: "Provider registry.terraform.io/hashicorp/aws not found"

**Solution:**
```bash
# Delete Terraform cache and reinitialize
rm -rf .terraform .terraform.lock.hcl
terraform init
```

---

## 📚 Quick Reference Commands

### Terraform Commands
```bash
terraform version          # Check Terraform version
terraform init            # Initialize project
terraform validate        # Validate configuration
terraform plan            # Preview changes
terraform apply           # Apply changes
terraform destroy         # Destroy resources
terraform fmt             # Format code
```

### AWS CLI Commands
```bash
aws --version                    # Check AWS CLI version
aws configure                    # Configure credentials
aws sts get-caller-identity     # Verify authentication
aws s3 ls                       # List S3 buckets
aws ec2 describe-instances      # List EC2 instances
```

---

## 🎯 What's Next?

**Congratulations!** You've completed the setup. Your development environment is ready.

**In the next article**, you'll:
- 🚀 Create your first AWS resource (S3 bucket) with Terraform
- 📝 Learn Terraform syntax and structure
- 🔄 Understand the Terraform workflow (init, plan, apply, destroy)
- 🗂️ Explore Terraform state files
- 💡 Learn best practices for organizing Terraform code

**Time:** 20 minutes  
**Difficulty:** Beginner  
**Result:** Your first real infrastructure deployed with code!

---

## 📖 Resources & Links

### Official Documentation
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### This Series
- 📖 **Previous:** [Part 1: Introduction to Terraform & IaC](https://dev.to/sarvar_04/series/36958)
- 📖 **Next:** Part 3: Provisioning Your First AWS Resource (Coming Soon)
- 💻 **Code Repository:** https://github.com/simplynadaf/terraform-by-sarvar
- 📚 **Full Series:** https://dev.to/sarvar_04/series/36958

### Connect With Me
- 🌐 Portfolio: [sarvarnadaf.com](https://sarvarnadaf.com)
- 💼 LinkedIn: [linkedin.com/in/sarvar04](https://www.linkedin.com/in/sarvar04/)
- 💻 GitHub: [@simplynadaf](https://github.com/simplynadaf)
- 📧 Email: simplynadaf@gmail.com

---

## 🎓 Conclusion

Setting up your development environment is the foundation of your Terraform journey. You've installed all the necessary tools, configured AWS access, and verified everything works.

**Key Takeaways:**
- ✅ Terraform is installed and working
- ✅ AWS CLI is configured with your credentials
- ✅ You can authenticate with AWS
- ✅ Your development environment is ready
- ✅ You've run your first Terraform commands

**Remember:**
- Keep your AWS credentials secure (never commit to Git)
- Use `us-east-1` region for free tier benefits
- Practice the commands we learned today
- Don't be afraid to experiment!

**In the next article**, we'll create real AWS infrastructure. You'll deploy your first S3 bucket using Terraform and understand the complete workflow.

---

## 💬 Your Turn!

**Before moving to the next article:**

1. ⭐ **Star the GitHub repo:** https://github.com/simplynadaf/terraform-by-sarvar
2. 📖 **Bookmark the series:** https://dev.to/sarvar_04/series/36958
3. 💬 **Drop a comment:** Did you face any issues during setup?
4. 🔗 **Share this article** with someone learning Terraform

**Questions?** Ask in the comments or open an issue on GitHub!

---

## 👉 Next Article

**Part 3: Provisioning Your First AWS Resource**

Ready to create real infrastructure? In the next article, you'll:
- Create an S3 bucket with Terraform
- Learn Terraform file structure
- Understand the complete workflow
- Manage infrastructure lifecycle

**See you in the next article! Let's start building! 🚀**

---

<div align="center">

**Setup Complete! Time to Build! 🎉**

⭐ Star the repo • 📖 Follow the series • 💬 Ask questions

Made with ❤️ by [Sarvar Nadaf](https://sarvarnadaf.com)

</div>
