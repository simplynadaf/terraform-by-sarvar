# Terraform Series - Complete Plan (REVISED)

> **Series Goal:** Take developers from zero to confidently managing production AWS infrastructure with Terraform

**Target Audience:** Developers with basic AWS knowledge, no Terraform experience  
**Learning Style:** Hands-on, practical, beginner-friendly  
**Time per Article:** 15-30 minutes read + practice

---

## 📚 Series Structure (10 Articles)

### **Phase 1: Foundation (Articles 1-5)** ✅ 5/5 Complete
Get started, understand basics, master core concepts

### **Phase 2: Real Infrastructure (Articles 6-10)**
Build production AWS services with Terraform

---

## 📖 Detailed Article Plan

---

## 🎯 PHASE 1: FOUNDATION (Articles 1-5) ✅ COMPLETE

### ✅ Article 1: Why Every Developer Should Learn Terraform
**Status:** ✅ Published  
**URL:** https://dev.to/aws-builders/why-every-developer-should-learn-terraform-in-2026-and-how-to-start--4fk0

**Focus:** Motivation and context  
**Topics:**
- Pain of manual infrastructure
- What is Terraform and IaC
- Benefits and use cases
- Career opportunities

**Outcome:** Reader understands WHY they need Terraform

---

### ✅ Article 2: Installing Terraform and Setting Up AWS
**Status:** ✅ Published  
**URL:** https://dev.to/aws-builders/installing-terraform-and-setting-up-your-environment-1j9b

**Focus:** Environment setup  
**Topics:**
- Install Terraform (Linux/Mac/Windows)
- Install and configure AWS CLI
- Set up AWS credentials
- Verify installation

**Outcome:** Reader has working Terraform + AWS environment

---

### ✅ Article 3: Your First AWS Resource - Creating an S3 Bucket
**Status:** ✅ Published  
**URL:** https://dev.to/aws-builders/your-first-infrastructure-as-code-in-four-commands-46ep

**Focus:** First hands-on experience  
**Topics:**
- Terraform workflow (init → plan → apply → destroy)
- Basic HCL syntax
- terraform, provider, resource blocks
- Outputs
- State file introduction

**Hands-On:** Create S3 bucket with tags and outputs

**Outcome:** Reader creates and destroys their first resource with confidence

---

### ✅ Article 4: Understanding Terraform State
**Status:** ✅ Complete (Tested)  
**URL:** Coming soon

**Focus:** State management fundamentals  
**Topics:**
- What is state and why it matters
- State commands (list, show, pull, mv, rm)
- Importing existing resources
- Detecting and handling state drift
- State manipulation best practices

**Hands-On:** Create 2 S3 buckets, use state commands, import resources

**Outcome:** Reader understands state is Terraform's "memory" and can manage it safely

---

### ✅ Article 5: Variables and Outputs - Making Code Reusable
**Status:** ✅ Complete (Tested)  
**URL:** Coming soon

**Focus:** Parameterization and flexibility  
**Topics:**
- All variable types (string, number, bool, list, map)
- Variable validation
- terraform.tfvars files
- Environment-specific configs (dev/prod)
- Outputs (basic, map, list, sensitive)
- Conditional resources (count)
- Multiple resources (count meta-argument)

**Hands-On:** Create reusable S3 infrastructure with variables

**Outcome:** Reader can write reusable, configurable code

---

## 🏗️ PHASE 2: REAL INFRASTRUCTURE (Articles 6-10)

### ✅ Article 6: Building Your First AWS VPC with Terraform
**Status:** ✅ Published  
**URL:** https://dev.to/aws-builders/building-your-first-vpc-aws-networking-with-terraform-3h34
**Status:** ✅ Complete (Tested, Pushed to GitHub & S3)  
**Focus:** Networking fundamentals

**Topics:**
- VPC creation
- Public and private subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Network ACLs
- Resource dependencies (implicit)

**Hands-On:**
```hcl
- Create VPC with CIDR block
- Create 2 public subnets (multi-AZ)
- Create 2 private subnets (multi-AZ)
- Internet Gateway for public subnets
- NAT Gateway for private subnets
- Route tables and associations
- Use data sources for AZs
```

**Outcome:** Reader can build production-ready VPC architecture

---

### 📝 Article 7: Deploy Web Servers with EC2 + Application Load Balancer
**Status:** ✅ Complete (Tested)  
**Focus:** Compute and load balancing

**Topics:**
- EC2 instance creation
- Security Groups
- Key pairs
- User data scripts
- Application Load Balancer (ALB)
- Target Groups
- Health checks
- Explicit dependencies (depends_on)

**Hands-On:**
```hcl
- Launch EC2 instances in VPC from Article 6
- Configure security groups (SSH, HTTP)
- Add user data to install web server
- Create ALB with target group
- Register EC2 instances
- Test load balancing
```

**Outcome:** Reader can deploy web servers with load balancing

---

### 📝 Article 8: Secure Database Deployment with RDS + Secrets Manager
**Status:** ✅ Complete (Tested)  
**Focus:** Stateful services and security

**Topics:**
- RDS instance creation
- DB subnet groups
- Parameter groups
- Security groups for databases
- AWS Secrets Manager
- Sensitive data handling
- Database backups and snapshots

**Hands-On:**
```hcl
- Create RDS MySQL instance
- Configure in private subnets
- Store credentials in Secrets Manager
- Connect EC2 to RDS
- Configure backup retention
- Use sensitive outputs
```

**Outcome:** Reader can deploy secure database infrastructure

---

### 📝 Article 9: AWS IAM Security with Terraform - Roles and Policies
**Status:** ✅ Complete (Tested)  
**Focus:** Security and permissions

**Topics:**
- IAM roles and policies
- Instance profiles
- Service roles
- Policy documents
- Assume role policies
- Least privilege principle
- Resource-based policies

**Hands-On:**
```hcl
- Create IAM role for EC2
- Attach policies (S3 access, CloudWatch)
- Create instance profile
- Launch EC2 with IAM role
- Create custom policies
- S3 bucket policies
```

**Outcome:** Reader can implement proper AWS security with IAM

---

### 📝 Article 10: Going Serverless - Deploy AWS Lambda with Terraform
**Status:** Planned  
**Focus:** Serverless compute and final project

**Topics:**
- Lambda function creation
- Function code deployment
- Environment variables
- IAM roles for Lambda
- Triggers (S3, API Gateway)
- CloudWatch Logs
- Lambda layers

**Hands-On:**
```hcl
- Create Lambda function (Python/Node.js)
- Package and deploy code
- Configure S3 trigger
- Set up CloudWatch logging
- Create API Gateway endpoint
- Test serverless workflow
```

**Outcome:** Reader can deploy serverless applications

---

## 📊 Series Statistics

**Total Articles:** 10  
**Completed:** 9 (90%)  
**In Progress:** 1  
**Planned:** 0

**AWS Services Covered:**
1. S3 ✅
2. VPC ✅
3. EC2 ✅
4. ALB ✅
5. RDS ✅
6. IAM ✅
7. Lambda (Article 10)
8. Secrets Manager ✅
9. CloudWatch ✅

**Terraform Concepts Covered:**
- ✅ Basic syntax and workflow
- ✅ State management
- ✅ Variables and outputs
- ✅ Count meta-argument
- ✅ Resource dependencies
- ✅ Data sources
- ✅ for_each
- ✅ Locals
- ✅ Dynamic blocks
- ✅ Functions
- ✅ Lifecycle rules
- ✅ Sensitive data handling

---

## 📅 Publishing Schedule

**Phase 1 (Complete):** Articles 1-5 ✅  
**Phase 2 (Almost Complete):** Articles 6-9 ✅, Article 10 (In Progress)

---

## 🔗 Resources
