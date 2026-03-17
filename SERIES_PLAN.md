# Terraform Series - Complete Plan (REVISED)

> **Series Goal:** Take developers from zero to confidently managing production AWS infrastructure with Terraform

**Target Audience:** Developers with basic AWS knowledge, no Terraform experience  
**Learning Style:** Hands-on, practical, beginner-friendly  
**Time per Article:** 15-30 minutes read + practice

---

## 📚 Series Structure (20 Articles)

### **Phase 1: Foundation (Articles 1-5)** ✅ 5/5 Complete
Get started, understand basics, master core concepts

### **Phase 2: Real Infrastructure (Articles 6-10)**
Build production AWS services with Terraform

### **Phase 3: Advanced Terraform (Articles 11-15)**
Master advanced features and patterns

### **Phase 4: Production Ready (Articles 16-20)**
Team workflows, best practices, real-world projects

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

### 📝 Article 6: Building a VPC - AWS Networking with Terraform
**Status:** Planned  
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

### 📝 Article 7: Deploying EC2 Instances and Load Balancers
**Status:** Planned  
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

### 📝 Article 8: RDS Database and Secrets Management
**Status:** Planned  
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

### 📝 Article 9: IAM Roles, Policies, and Security
**Status:** Planned  
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

### 📝 Article 10: Lambda Functions and Serverless
**Status:** Planned  
**Focus:** Serverless compute

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

## 🚀 PHASE 3: ADVANCED TERRAFORM (Articles 11-15)

### 📝 Article 11: Terraform Modules - Code Organization
**Status:** Planned  
**Focus:** Reusability and organization

**Topics:**
- What are modules
- Creating custom modules
- Module inputs and outputs
- Using registry modules
- Module versioning
- Module composition
- Project structure

**Hands-On:**
```hcl
- Create VPC module
- Create EC2 module
- Use modules from registry
- Pass variables between modules
- Organize multi-environment project
```

**Outcome:** Reader can organize code with modules

---

### 📝 Article 12: EKS - Kubernetes on AWS
**Status:** Planned  
**Focus:** Container orchestration

**Topics:**
- EKS cluster creation
- Node groups (managed)
- Fargate profiles
- IAM roles for EKS
- VPC configuration for EKS
- kubectl configuration
- Add-ons (VPC CNI, CoreDNS)
- IRSA (IAM Roles for Service Accounts)

**Hands-On:**
```hcl
- Create EKS cluster
- Configure node groups
- Set up IAM roles
- Deploy sample application
- Configure kubectl access
- Set up ingress controller
```

**Outcome:** Reader can deploy Kubernetes clusters on AWS

---

### 📝 Article 13: Advanced Resource Management
**Status:** Planned  
**Focus:** Advanced Terraform features

**Topics:**
- for_each (vs count)
- Locals (computed values)
- Dynamic blocks
- Lifecycle rules (create_before_destroy, prevent_destroy)
- Null resources
- Terraform console
- Complex data structures

**Hands-On:**
```hcl
- Use for_each for multiple resources
- Create locals for computed values
- Generate dynamic security group rules
- Implement lifecycle rules
- Use null_resource for provisioning
```

**Outcome:** Reader masters advanced Terraform patterns

---

### 📝 Article 14: Terraform Functions and Expressions
**Status:** Planned  
**Focus:** Built-in functions and logic

**Topics:**
- String functions (format, join, split)
- Collection functions (merge, concat, flatten)
- Numeric functions (min, max, ceil)
- Type conversion functions
- Conditional expressions
- For expressions
- Splat expressions

**Hands-On:**
```hcl
- Use functions for dynamic naming
- Manipulate lists and maps
- Create complex conditionals
- Transform data structures
- Build dynamic configurations
```

**Outcome:** Reader can use Terraform's powerful function library

---

### 📝 Article 15: CloudWatch Monitoring and Alarms
**Status:** Planned  
**Focus:** Observability

**Topics:**
- CloudWatch metrics
- CloudWatch alarms
- SNS notifications
- Log groups and streams
- Metric filters
- Dashboards
- Composite alarms

**Hands-On:**
```hcl
- Create CloudWatch alarms for EC2
- Set up SNS topics
- Configure email notifications
- Create log groups for Lambda
- Build CloudWatch dashboard
- Set up billing alarms
```

**Outcome:** Reader can implement comprehensive monitoring

---

## 🎓 PHASE 4: PRODUCTION READY (Articles 16-20)

### 📝 Article 16: Remote State and Team Collaboration
**Status:** Planned  
**Focus:** Team workflows

**Topics:**
- Remote state with S3
- State locking with DynamoDB
- State encryption
- Backend configuration
- Migrating to remote state
- State versioning
- Team best practices

**Hands-On:**
```hcl
- Create S3 bucket for state
- Create DynamoDB table for locking
- Configure backend
- Migrate existing state
- Enable versioning and encryption
```

**Outcome:** Reader can set up team-ready state management

---

### 📝 Article 17: Workspaces and Multi-Environment Management
**Status:** Planned  
**Focus:** Environment isolation

**Topics:**
- Terraform workspaces
- When to use workspaces
- Workspace-specific configurations
- Environment variables
- Workspace vs separate state files
- Best practices

**Hands-On:**
```hcl
- Create dev/staging/prod workspaces
- Deploy different configs per workspace
- Use workspace name in resources
- Switch between workspaces
```

**Outcome:** Reader can manage multiple environments efficiently

---

### 📝 Article 18: Testing and Validation
**Status:** Planned  
**Focus:** Quality assurance

**Topics:**
- terraform validate
- terraform fmt
- terraform plan -detailed-exitcode
- Policy as Code (Sentinel/OPA)
- Terratest basics
- Pre-commit hooks
- Automated testing

**Hands-On:**
```hcl
- Set up validation pipeline
- Write policy checks
- Create pre-commit hooks
- Implement basic Terratest
- Automate formatting
```

**Outcome:** Reader can implement testing strategies

---

### 📝 Article 19: CI/CD with GitHub Actions
**Status:** Planned  
**Focus:** Automation

**Topics:**
- GitHub Actions for Terraform
- Automated plan on PR
- Automated apply on merge
- Approval workflows
- Secrets management in CI/CD
- Terraform Cloud integration
- Cost estimation in CI/CD

**Hands-On:**
```hcl
- Create GitHub Actions workflow
- Set up plan on pull request
- Configure apply on merge
- Add approval gates
- Integrate with Slack/Teams
```

**Outcome:** Reader can automate Terraform workflows

---

### 📝 Article 20: Real-World Project - Complete 3-Tier Application
**Status:** Planned  
**Focus:** Everything combined

**Topics:**
- Complete architecture design
- All concepts from previous articles
- Production best practices
- Security hardening
- Cost optimization
- Disaster recovery

**Hands-On:**
```hcl
Build complete infrastructure:
- VPC with public/private subnets
- ALB + Auto Scaling EC2 instances
- RDS Multi-AZ database
- ElastiCache for caching
- S3 for static assets
- CloudFront CDN
- Lambda for background jobs
- CloudWatch monitoring
- IAM roles and policies
- Secrets management
- Backup and recovery
- CI/CD pipeline
```

**Outcome:** Reader can build production-ready AWS infrastructure

---

## 📊 Series Statistics

**Total Articles:** 20  
**Completed:** 5 (25%)  
**In Progress:** 0  
**Planned:** 15 (75%)

**AWS Services Covered:**
1. S3 ✅
2. VPC
3. EC2
4. ALB
5. RDS
6. IAM
7. Lambda
8. EKS
9. CloudWatch
10. Secrets Manager
11. Auto Scaling
12. ElastiCache
13. CloudFront
14. SNS

**Terraform Concepts Covered:**
- ✅ Basic syntax and workflow
- ✅ State management
- ✅ Variables and outputs
- ✅ Count meta-argument
- Resource dependencies
- Data sources
- Modules
- for_each
- Locals
- Dynamic blocks
- Functions
- Lifecycle rules
- Remote state
- Workspaces
- Testing
- CI/CD

---

## 🎓 Terraform Theory Coverage Map

### ✅ Already Covered (Articles 1-5):
- **Basics:** HCL syntax, terraform/provider/resource blocks
- **Workflow:** init, plan, apply, destroy
- **State:** What it is, state commands, importing, drift detection
- **Variables:** All types (string, number, bool, list, map), validation, tfvars
- **Outputs:** Basic, map, list, sensitive
- **Meta-arguments:** count (with ternary conditionals)

### 📝 To Be Covered (Articles 6-20):

**Article 6 (VPC):**
- ✅ Resource dependencies (implicit)
- ✅ Data sources (vs resources)
- ✅ Resource references

**Article 7 (EC2 + ALB):**
- ✅ depends_on (explicit dependencies)
- ✅ User data and provisioning basics

**Article 8 (RDS):**
- ✅ Sensitive data handling
- ✅ AWS Secrets Manager integration

**Article 9 (IAM):**
- ✅ Policy documents
- ✅ jsonencode function
- ✅ Resource-based policies

**Article 11 (Modules):**
- ✅ Module creation
- ✅ Module inputs/outputs
- ✅ Module versioning
- ✅ Module composition
- ✅ Project structure

**Article 12 (EKS):**
- ✅ Complex multi-resource dependencies
- ✅ ConfigMaps and Kubernetes provider

**Article 13 (Advanced Features):**
- ✅ **for_each** (vs count)
- ✅ **Locals** (local values)
- ✅ **Dynamic blocks**
- ✅ **Lifecycle rules** (create_before_destroy, prevent_destroy, ignore_changes)
- ✅ **Null resources**
- ✅ **Terraform console**

**Article 14 (Functions):**
- ✅ **String functions** (format, join, split, replace, regex)
- ✅ **Collection functions** (merge, concat, flatten, distinct, keys, values)
- ✅ **Numeric functions** (min, max, ceil, floor)
- ✅ **Type conversion** (tostring, tonumber, tolist, tomap)
- ✅ **Conditional expressions** (ternary, coalesce)
- ✅ **For expressions**
- ✅ **Splat expressions** ([*])

**Article 15 (CloudWatch):**
- ✅ Resource monitoring patterns
- ✅ Alarm configurations

**Article 16 (Remote State):**
- ✅ **S3 backend configuration**
- ✅ **State locking** (DynamoDB)
- ✅ **State encryption**
- ✅ **Backend migration**
- ✅ **State versioning**

**Article 17 (Workspaces):**
- ✅ **Terraform workspaces**
- ✅ **Workspace-specific configs**
- ✅ **When to use vs separate state files**

**Article 18 (Testing):**
- ✅ **terraform validate**
- ✅ **terraform fmt**
- ✅ **terraform plan -detailed-exitcode**
- ✅ **Policy as Code** (Sentinel/OPA basics)
- ✅ **Pre-commit hooks**
- ✅ **Terratest** (introduction)

**Article 19 (CI/CD):**
- ✅ **Automated workflows**
- ✅ **Approval gates**
- ✅ **Secrets in CI/CD**

**Article 20 (Real Project):**
- ✅ **All concepts combined**
- ✅ **Production best practices**
- ✅ **Security hardening**
- ✅ **Cost optimization**
- ✅ **Disaster recovery**

### 🔧 Additional Terraform Commands Covered:
- ✅ terraform init (Article 3)
- ✅ terraform plan (Article 3)
- ✅ terraform apply (Article 3)
- ✅ terraform destroy (Article 3)
- ✅ terraform state list/show/mv/rm (Article 4)
- ✅ terraform import (Article 4)
- ✅ terraform output (Article 5)
- terraform validate (Article 18)
- terraform fmt (Article 18)
- terraform console (Article 13)
- terraform graph (Article 6)
- terraform refresh (Article 4)

### 📊 Concept Coverage Summary:

**Core Concepts:** 100% covered across 20 articles
- Syntax, workflow, state, variables, outputs ✅
- Dependencies, data sources, modules ✅
- Advanced meta-arguments (count, for_each) ✅
- Functions and expressions ✅
- Remote state and workspaces ✅

**Production Skills:** 100% covered
- Testing, validation, CI/CD ✅
- Security, monitoring, best practices ✅
- Team collaboration ✅

---

### Foundation → Real Infrastructure → Advanced Features → Production

```
Articles 1-5:   Master Terraform basics
                ↓
Articles 6-10:  Build real AWS services (VPC, EC2, RDS, Lambda, EKS)
                ↓
Articles 11-15: Advanced Terraform (Modules, EKS, Functions, Monitoring)
                ↓
Articles 16-20: Production ready (Remote state, CI/CD, Testing, Real project)
```

---

## 📅 Publishing Schedule

**Phase 1 (Complete):** Articles 1-5 ✅  
**Phase 2 (Next):** Articles 6-10 (VPC → EC2 → RDS → IAM → Lambda)  
**Phase 3:** Articles 11-15 (Modules → EKS → Advanced → Functions → Monitoring)  
**Phase 4:** Articles 16-20 (Remote State → Workspaces → Testing → CI/CD → Final Project)

---

## 🔗 Resources

- **Series:** https://dev.to/sarvar_04/series/36963
- **GitHub:** https://github.com/simplynadaf/terraform-by-sarvar
- **Author:** [Sarvar Nadaf](https://sarvarnadaf.com)

---

**Last Updated:** March 17, 2026  
**Status:** Phase 1 Complete (5/20 articles)  
**Next:** Article 6 - Building a VPC

**Hands-On:**
```hcl
- Store RDS password in Secrets Manager
- Reference secrets in Terraform
- Mark outputs as sensitive
- Use .gitignore properly
```

**Outcome:** Reader knows how to handle secrets securely

---

### 📝 Article 10: Terraform Workspaces - Managing Multiple Environments
**Status:** Planned  
**Focus:** Environment separation  
**Topics:**
- What are workspaces
- Creating dev/staging/prod workspaces
- Workspace-specific variables
- When to use workspaces vs separate state
- Workspace best practices

**Hands-On:**
```hcl
- Create dev/prod workspaces
- Deploy same code to different environments
- Use workspace name in resource naming
```

**Outcome:** Reader can manage multiple environments

---

### 📝 Article 11: Real-World Project - Complete Web Application Infrastructure
**Status:** Planned  
**Focus:** Putting it all together  
**Topics:**
- Project structure
- VPC with public/private subnets
- Application Load Balancer
- Auto Scaling Group
- RDS database
- S3 for static assets
- CloudFront CDN

**Hands-On:**
```hcl
- Build complete 3-tier architecture
- Use modules
- Implement remote state
- Add proper tagging
- Cost estimation
```

**Outcome:** Reader builds production-like infrastructure

---

### 📝 Article 12: Terraform Best Practices and Code Quality
**Status:** Planned  
**Focus:** Professional standards  
**Topics:**
- Naming conventions
- File organization
- terraform fmt and validate
- tflint for linting
- Pre-commit hooks
- Documentation standards

**Hands-On:**
```bash
- Set up tflint
- Configure pre-commit hooks
- Write module documentation
- Code review checklist
```

**Outcome:** Reader writes clean, maintainable code

---

### 📝 Article 13: Testing Terraform Code
**Status:** Planned  
**Focus:** Quality assurance  
**Topics:**
- terraform validate
- terraform plan testing
- Terratest basics
- Policy as Code (OPA/Sentinel)
- CI/CD integration

**Hands-On:**
```hcl
- Write basic Terratest
- Set up GitHub Actions for validation
- Implement policy checks
```

**Outcome:** Reader can test infrastructure code

---

### 📝 Article 14: Troubleshooting and Debugging
**Status:** Planned  
**Focus:** Problem solving  
**Topics:**
- Common errors and solutions
- TF_LOG environment variable
- State file issues
- Dependency problems
- Provider version conflicts
- terraform refresh vs apply

**Hands-On:**
```bash
- Debug real error scenarios
- Fix state drift
- Resolve version conflicts
- Use terraform console
```

**Outcome:** Reader can diagnose and fix issues

---

### 📝 Article 15: Advanced Topics and What's Next
**Status:** Planned  
**Focus:** Future learning path  
**Topics:**
- Terraform Cloud/Enterprise
- Multi-cloud strategies
- Custom providers
- Terraform CDK
- GitOps workflows
- Career opportunities

**Resources:**
- Certification path
- Community resources
- Advanced courses
- Real-world case studies

**Outcome:** Reader knows their next steps

---

## 🎯 Learning Progression

```
Article 1-2:  Setup & Motivation
              ↓
Article 3:    First Resource (S3)
              ↓
Article 4-5:  Core Concepts (State, Variables)
              ↓
Article 6-7:  Multi-Resource & Modules
              ↓
Article 8-10: Team Workflows (Remote State, Secrets, Workspaces)
              ↓
Article 11:   Real Project
              ↓
Article 12-14: Professional Skills (Best Practices, Testing, Debugging)
              ↓
Article 15:   Advanced & Next Steps
```

---

## 📊 Series Metrics

**Total Articles:** 15  
**Estimated Timeline:** 15 weeks (1 article/week)  
**Total Learning Time:** ~8-10 hours  
**Hands-On Projects:** 11  
**AWS Resources Used:** S3, EC2, VPC, RDS, ALB, ASG, CloudFront  
**Cost:** Mostly free tier, <$5 total if careful

---

## 🎓 Skills Gained

By completing this series, readers will be able to:

✅ Write Terraform code from scratch  
✅ Manage AWS infrastructure as code  
✅ Use modules for code reusability  
✅ Implement remote state for teams  
✅ Handle secrets securely  
✅ Manage multiple environments  
✅ Build production-ready infrastructure  
✅ Follow best practices  
✅ Test and debug Terraform code  
✅ Collaborate with teams using Terraform  

---

## 📝 Writing Guidelines

**Consistency Across Articles:**

1. **Structure:**
   - Hook/Story opening
   - Clear learning objectives
   - Step-by-step instructions
   - Hands-on examples
   - Common pitfalls
   - Summary and next steps

2. **Tone:**
   - Friendly and encouraging
   - Beginner-friendly language
   - Real-world analogies
   - Acknowledge difficulties

3. **Code Examples:**
   - Complete and tested
   - Well-commented
   - Copy-paste ready
   - Include expected output

4. **Visuals:**
   - Screenshots of key steps
   - Architecture diagrams
   - Before/after comparisons

5. **Length:**
   - 2000-3000 words
   - 15-30 minute read
   - Balance theory and practice

---

## 🔗 Cross-References

Each article should:
- Link to previous article (recap)
- Link to next article (preview)
- Reference GitHub repo with code
- Link to official documentation
- Provide troubleshooting resources

---

## 📦 GitHub Repository Structure

```
terraform-series/
├── README.md
├── articles/
│   ├── 01-introduction/
│   ├── 02-installation/
│   ├── 03-first-resource/
│   │   ├── article.md
│   │   └── terraform/
│   │       └── main.tf
│   ├── 04-state-management/
│   ├── 05-variables-outputs/
│   ├── 06-multi-resource/
│   ├── 07-modules/
│   ├── 08-remote-state/
│   ├── 09-secrets/
│   ├── 10-workspaces/
│   ├── 11-real-project/
│   ├── 12-best-practices/
│   ├── 13-testing/
│   ├── 14-troubleshooting/
│   └── 15-advanced/
└── examples/
    └── complete-projects/
```

---

## ✅ Success Criteria

**For Each Article:**
- [ ] Code tested and working
- [ ] Screenshots captured
- [ ] Links verified
- [ ] Peer reviewed
- [ ] Published on dev.to
- [ ] GitHub repo updated
- [ ] Social media shared

**For Series:**
- [ ] All 15 articles published
- [ ] Complete GitHub repository
- [ ] Reader feedback incorporated
- [ ] Community engagement
- [ ] Potential for ebook/course

---

## 🚀 Next Steps

1. **Immediate:** Complete Article 3 (First Resource)
2. **Week 2:** Article 4 (State Management)
3. **Week 3:** Article 5 (Variables)
4. Continue weekly cadence through Article 15

---

**Last Updated:** March 16, 2026  
**Status:** Articles 1-3 Published, Article 4 Complete (Testing Done)  
**Next Milestone:** Publish Article 4, Start Article 5 (Variables)
