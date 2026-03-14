# Your First Terraform Resource in 4 Commands

> *"The journey from clicking to coding starts with a single resource."*

## 🎯 Welcome Back!

Remember in [Article 1](https://dev.to/sarvar_04/why-every-developer-should-learn-terraform-in-2026-and-how-to-start-5hh5) when I showed you the pain of clicking through AWS Console for hours? And in [Article 2](https://dev.to/sarvar_04/installing-terraform-and-setting-up-your-aws-environment-step-by-step-guide-4ck7) we got Terraform installed?

**Today, you'll experience the magic moment** - creating real AWS infrastructure with just a few lines of code.

**By the end of this article, you'll:**
- ✅ Understand the Terraform workflow (the 4 commands you'll use forever)
- ✅ Write your first `.tf` file
- ✅ Create an actual S3 bucket on AWS
- ✅ Understand what a state file is and why it matters
- ✅ Clean up resources properly

**Time Required:** 20 minutes  
**Cost:** $0 (S3 bucket is free tier)  
**Difficulty:** Beginner-friendly

Let's create some infrastructure! 🚀

---

## 💡 Quick Theory: The Terraform Workflow

Before we dive in, you need to know the **4 commands** that form the core Terraform workflow. You'll use these commands for every project, whether you're creating a simple S3 bucket or a complex multi-tier application.

### The Magic 4 Commands:

```bash
terraform init      # Initialize - Download providers
terraform plan      # Preview - See what will change
terraform apply     # Execute - Create the resources
terraform destroy   # Cleanup - Remove everything
```

Think of it like cooking:
- **init** = Get your ingredients and tools ready
- **plan** = Read the recipe and imagine the final dish
- **apply** = Actually cook the meal
- **destroy** = Clean up the kitchen

**That's it!** Master these 4 commands, and you've mastered the Terraform workflow.

---

## 📝 Understanding Terraform Files

Terraform uses files with `.tf` extension written in **HCL** (HashiCorp Configuration Language). Don't worry - it's much simpler than it sounds!

### Basic Structure:

```hcl
# This is a comment

block_type "label" "name" {
  argument = "value"
  another_argument = 123
}
```

**Three main block types you'll use:**

1. **terraform** - Configuration settings
2. **provider** - Which cloud (AWS, Azure, GCP)
3. **resource** - What to create (S3, EC2, etc.)

Let's see them in action!

---

## 🛠️ Hands-On: Create Your First S3 Bucket

### Step 1: Create Your Project Directory

```bash
# Create a directory for your first Terraform project
mkdir -p ~/terraform-first-resource
cd ~/terraform-first-resource
```

### Step 2: Write Your First Terraform Code

Create a file called `main.tf`:

```bash
nano main.tf
# Or use your favorite editor: vim, VS Code, etc.
```

**Copy this code:**

```hcl
# Terraform configuration block
# Specifies Terraform version and required providers
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider configuration
# Tells Terraform to use AWS in us-east-1 region
provider "aws" {
  region = "us-east-1"
}

# Resource block - This creates the actual S3 bucket
resource "aws_s3_bucket" "my_first_bucket" {
  # Bucket name must be globally unique across ALL AWS accounts
  # Replace 'yourname' with your actual name or username
  bucket = "terraform-first-bucket-yourname-2026"
  
  # Tags help organize and track resources
  tags = {
    Name        = "My First Terraform Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    CreatedBy   = "YourName"
  }
}

# Output block - Displays information after creation
output "bucket_name" {
  value       = aws_s3_bucket.my_first_bucket.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.my_first_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_region" {
  value       = aws_s3_bucket.my_first_bucket.region
  description = "The region where bucket is created"
}
```

**⚠️ Important:** Change `yourname` in the bucket name to something unique (your name, username, or random string). S3 bucket names must be globally unique across ALL AWS accounts!

**Save the file** (Ctrl+X, then Y, then Enter if using nano)

---

## 🚀 The 4 Commands in Action

Now comes the exciting part! Let's run our 4 magic commands.

### Command 1: terraform init

This downloads the AWS provider plugin.

```bash
terraform init
```

**You'll see:**
```
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.x.x...
- Installed hashicorp/aws v5.x.x

Terraform has been successfully initialized!
```

**What just happened?**
- Terraform downloaded the AWS provider plugin
- Created a `.terraform/` directory (hidden folder)
- Created `.terraform.lock.hcl` file (locks provider versions)

**Pro Tip:** You only need to run `init` once per project, or when you add new providers.

---

### Command 2: terraform plan

This shows you what Terraform will create (without actually creating it).

```bash
terraform plan
```

**You'll see:**
```
Terraform will perform the following actions:

  # aws_s3_bucket.my_first_bucket will be created
  + resource "aws_s3_bucket" "my_first_bucket" {
      + bucket                      = "terraform-first-bucket-yourname-2026"
      + bucket_domain_name          = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + tags                        = {
          + "CreatedBy"   = "YourName"
          + "Environment" = "Learning"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "My First Terraform Bucket"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

**Understanding the output:**
- `+` means "will be created"
- `~` means "will be modified" (you'll see this later)
- `-` means "will be destroyed"
- `(known after apply)` means AWS will generate this value

**This is your safety check!** Always review the plan before applying.

---

### Command 3: terraform apply

This actually creates the resources on AWS.

```bash
terraform apply
```

**Terraform will show the plan again and ask for confirmation:**
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```

**Type `yes` and press Enter.**

**You'll see:**
```
aws_s3_bucket.my_first_bucket: Creating...
aws_s3_bucket.my_first_bucket: Creation complete after 2s [id=terraform-first-bucket-yourname-2026]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

bucket_arn = "arn:aws:s3:::terraform-first-bucket-yourname-2026"
bucket_name = "terraform-first-bucket-yourname-2026"
bucket_region = "us-east-1"
```

**🎉 Congratulations!** You just created your first AWS resource with code!

---

### Verify in AWS Console

Let's confirm it's really there:

1. Go to [AWS S3 Console](https://s3.console.aws.amazon.com/s3/buckets)
2. You should see your bucket: `terraform-first-bucket-yourname-2026`
3. Click on it and check the **Tags** tab - you'll see all the tags you defined!

**This is the "aha!" moment** - you created AWS infrastructure without clicking through the console!

---

## 🗂️ Understanding the State File

After running `terraform apply`, you'll notice a new file: `terraform.tfstate`

```bash
ls -la
```

**You'll see:**
```
.terraform/
.terraform.lock.hcl
main.tf
terraform.tfstate
```

### What is the State File?

The state file is **Terraform's memory**. It stores:
- What resources Terraform created
- Current configuration of those resources
- Metadata and dependencies

**Let's peek inside:**

```bash
cat terraform.tfstate
```

You'll see JSON with details about your S3 bucket - its name, ARN, region, tags, etc.

### Why Does State Matter?

When you run `terraform plan` or `terraform apply` again, Terraform:
1. Reads the state file to know what exists
2. Compares it with your `.tf` files
3. Calculates what needs to change

**Without state, Terraform wouldn't know what it created!**

**⚠️ Important State Rules:**
- Never edit state files manually
- Never delete state files (you'll lose track of resources)
- Never commit state files to Git (they contain sensitive data)
- For teams, use remote state (we'll cover this in Article 8)

---

## 🧪 Let's Make a Change

Now let's see Terraform's power - making changes to existing infrastructure.

**Edit your `main.tf` file and add a new tag:**

```hcl
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "terraform-first-bucket-yourname-2026"
  
  tags = {
    Name        = "My First Terraform Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    CreatedBy   = "YourName"
    Updated     = "Yes"  # ← Add this new tag
  }
}
```

**Run plan again:**

```bash
terraform plan
```

**You'll see:**
```
  # aws_s3_bucket.my_first_bucket will be updated in-place
  ~ resource "aws_s3_bucket" "my_first_bucket" {
      ~ tags     = {
          + "Updated"     = "Yes"
            # (4 unchanged elements hidden)
        }
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

Notice the `~` symbol - it means "modify existing resource"!

**Apply the change:**

```bash
terraform apply
```

Type `yes` when prompted.

**Check AWS Console** - your bucket now has the new tag!

**This is Infrastructure as Code magic** - you changed infrastructure by editing a text file!

---

## 🧹 Command 4: terraform destroy

Always clean up resources you're not using (to avoid unexpected charges).

```bash
terraform destroy
```

**Terraform will show what it will delete:**
```
  # aws_s3_bucket.my_first_bucket will be destroyed
  - resource "aws_s3_bucket" "my_first_bucket" {
      - bucket = "terraform-first-bucket-yourname-2026"
      ...
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Enter a value:
```

**Type `yes` to confirm.**

```
aws_s3_bucket.my_first_bucket: Destroying...
aws_s3_bucket.my_first_bucket: Destruction complete after 1s

Destroy complete! Resources: 1 destroyed.
```

**Verify in AWS Console** - your bucket is gone!

---

## 🎓 What You Just Learned

Let's recap what you accomplished:

✅ **The Terraform Workflow:**
- `init` - Initialize project
- `plan` - Preview changes
- `apply` - Create resources
- `destroy` - Clean up

✅ **HCL Basics:**
- terraform block (configuration)
- provider block (cloud provider)
- resource block (what to create)
- output block (display information)

✅ **State Management:**
- State file tracks resources
- Never edit state manually
- State enables change detection

✅ **Real Infrastructure:**
- Created actual AWS S3 bucket
- Modified existing resource
- Destroyed resources cleanly

---

## 🐛 Common Issues and Solutions

### Issue 1: Bucket Name Already Exists

**Error:**
```
Error: creating S3 Bucket: BucketAlreadyExists
```

**Solution:** S3 bucket names are globally unique. Change your bucket name to something more unique:
```hcl
bucket = "terraform-first-bucket-yourname-12345-2026"
```

---

### Issue 2: Invalid Bucket Name

**Error:**
```
Error: invalid bucket name
```

**Solution:** S3 bucket names must:
- Be 3-63 characters long
- Use only lowercase letters, numbers, and hyphens
- Start with a letter or number
- Not use uppercase or underscores

**Bad:** `My_Bucket_Name`  
**Good:** `my-bucket-name`

---

### Issue 3: AWS Credentials Not Found

**Error:**
```
Error: No valid credential sources found
```

**Solution:** Configure AWS credentials (from Article 2):
```bash
aws configure
```

Enter your AWS Access Key ID and Secret Access Key.

---

### Issue 4: Permission Denied

**Error:**
```
Error: AccessDenied: Access Denied
```

**Solution:** Your AWS user needs S3 permissions. Attach the `AmazonS3FullAccess` policy to your IAM user in AWS Console.

---

## 💡 Best Practices You Should Follow

### 1. Always Use Version Control
```bash
git init
echo ".terraform/" >> .gitignore
echo "terraform.tfstate*" >> .gitignore
echo "*.tfvars" >> .gitignore
git add main.tf .gitignore
git commit -m "Add first Terraform resource"
```

### 2. Use Meaningful Names
**Bad:**
```hcl
resource "aws_s3_bucket" "b" {
  bucket = "bucket1"
}
```

**Good:**
```hcl
resource "aws_s3_bucket" "application_logs" {
  bucket = "myapp-logs-production-2026"
}
```

### 3. Always Add Tags
Tags help with:
- Cost tracking
- Resource organization
- Automation
- Compliance

**Minimum tags:**
```hcl
tags = {
  Name        = "Resource purpose"
  Environment = "dev/staging/prod"
  ManagedBy   = "Terraform"
  Owner       = "team-name"
}
```

### 4. Run Plan Before Apply
**Never skip `terraform plan`!** It's your safety net.

### 5. Use Descriptive Outputs
Outputs make it easy to get important information:
```hcl
output "bucket_name" {
  value       = aws_s3_bucket.my_first_bucket.id
  description = "The name of the S3 bucket"
}
```

---

## 🔍 Understanding What Happened Behind the Scenes

When you ran `terraform apply`, here's what happened:

1. **Terraform read your `main.tf` file**
   - Parsed the HCL syntax
   - Understood you want an S3 bucket

2. **Terraform checked the state file**
   - Found it was empty (first run)
   - Knew it needed to create the bucket

3. **Terraform called AWS API**
   - Used your AWS credentials
   - Made API call: `CreateBucket`
   - Set the tags with `PutBucketTagging`

4. **AWS created the bucket**
   - Generated unique bucket ID
   - Returned bucket details

5. **Terraform updated state file**
   - Saved bucket information
   - Recorded all attributes

6. **Terraform displayed outputs**
   - Showed the values you defined

**This is the power of Infrastructure as Code** - complex API calls abstracted into simple, readable code!

---

## 🎯 Challenge: Try It Yourself

Before moving to the next article, try these challenges:

### Challenge 1: Create Multiple Buckets
Create 2 different S3 buckets in the same `main.tf` file.

**Hint:**
```hcl
resource "aws_s3_bucket" "bucket_one" {
  bucket = "my-first-bucket-yourname"
}

resource "aws_s3_bucket" "bucket_two" {
  bucket = "my-second-bucket-yourname"
}
```

### Challenge 2: Use Different Region
Change the provider region to `us-west-2` and create a bucket there.

### Challenge 3: Add More Tags
Add 3 more custom tags to your bucket (Project, CostCenter, Department).

### Challenge 4: Format Your Code
Run `terraform fmt` to automatically format your code:
```bash
terraform fmt
```

### Challenge 5: Validate Your Code
Run `terraform validate` to check for syntax errors:
```bash
terraform validate
```

---

## 📚 Additional Terraform Commands

Beyond the core 4 commands, here are useful ones:

```bash
# Format your code (auto-fix indentation)
terraform fmt

# Validate syntax
terraform validate

# Show current state
terraform show

# List resources in state
terraform state list

# Get detailed resource info
terraform state show aws_s3_bucket.my_first_bucket

# View outputs without applying
terraform output

# View specific output
terraform output bucket_name
```

---

## 🔗 Useful Resources

- **Terraform AWS Provider Docs:** https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- **S3 Bucket Resource:** https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
- **HCL Syntax:** https://developer.hashicorp.com/terraform/language/syntax/configuration
- **Terraform CLI Commands:** https://developer.hashicorp.com/terraform/cli/commands

---

## 🎬 What's Next?

In **Article 4: Understanding Terraform State**, we'll dive deeper into:
- How state files work internally
- State commands (`state list`, `state show`, `state mv`)
- Importing existing AWS resources
- State locking and remote state (preview)
- Recovering from state issues

**You'll learn:**
- Why state is Terraform's most important file
- How to inspect and manipulate state safely
- What to do when state gets out of sync
- Preparing for team collaboration

---

## 📝 Summary

Today you learned the **foundation of Terraform**:

**The 4 Core Commands:**
```bash
terraform init     # Get ready
terraform plan     # Preview
terraform apply    # Execute
terraform destroy  # Cleanup
```

**Key Concepts:**
- `.tf` files contain your infrastructure code
- State files track what Terraform created
- HCL syntax is simple and readable
- Always plan before applying
- Tags help organize resources

**You created real infrastructure with code!** No more clicking through AWS Console for simple tasks.

---

## 💬 Let's Connect

**Did this article help you?** 
- ⭐ Star the [GitHub repo](https://github.com/simplynadaf/terraform-by-sarvar)
- 💬 Comment below with your experience
- 🔄 Share with someone learning Terraform
- 🐦 Follow me on [Twitter/X](https://x.com/sarvar_04)
- 💼 Connect on [LinkedIn](https://www.linkedin.com/in/sarvar-nadaf/)

**Questions or stuck somewhere?** Drop a comment below - I read and respond to every one!

---

## 🏷️ Tags

#terraform #aws #devops #infrastructure #iac #cloud #s3 #beginners #tutorial #learning

---

**Next Article:** [Understanding Terraform State - The Complete Guide](#)

**Previous Article:** [Installing Terraform and Setting Up Your AWS Environment](https://dev.to/sarvar_04/installing-terraform-and-setting-up-your-aws-environment-step-by-step-guide-4ck7)

**Series Home:** [Terraform Series - From Zero to Hero](https://dev.to/sarvar_04/series/36958)

---

*Happy Terraforming! 🚀*
