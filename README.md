<div align="center">

# 🚀 Terraform By Sarvar

### Complete Terraform tutorial series from basics to advanced concepts

[![Terraform](https://img.shields.io/badge/Terraform-v1.14+-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![dev.to](https://img.shields.io/badge/dev.to-Series-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/sarvar_04/series/36958)

[📖 Read the Series](https://dev.to/sarvar_04/series/36963) • [🌐 Portfolio](https://sarvarnadaf.com) • [💼 LinkedIn](https://www.linkedin.com/in/sarvar04/)

</div>

---

## 📚 Series Overview

This repository contains **ONLY Terraform code examples** for the **Terraform By Sarvar** tutorial series.

> **⚠️ IMPORTANT:** This repo contains only `.tf` files and infrastructure code. Articles are published on dev.to, not stored here.

📖 **Read the series on dev.to:** https://dev.to/sarvar_04/series/36963

### 🎯 What You'll Learn
- ✅ Infrastructure as Code (IaC) fundamentals
- ✅ Terraform basics to advanced concepts
- ✅ AWS resource provisioning
- ✅ Best practices and real-world patterns
- ✅ Production-ready configurations

### 📊 Series Progress
![Progress](https://img.shields.io/badge/Articles-9%2F10-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Almost%20Complete-success?style=flat-square)

## 📖 Article Series

### 📘 Foundation (Articles 1-5) ✅ Complete
1. [Introduction to Terraform & IaC](https://dev.to/aws-builders/why-every-developer-should-learn-terraform-in-2026-and-how-to-start--4fk0) - ✅ Published
2. [Installation & Setup](https://dev.to/aws-builders/installing-terraform-and-setting-up-your-environment-1j9b) - ✅ Published
3. [Your First AWS Resource](https://dev.to/aws-builders/your-first-infrastructure-as-code-in-four-commands-46ep) - ✅ Published
4. [Understanding Terraform State](https://dev.to/aws-builders/terraform-state-the-one-file-you-cant-afford-to-lose-33l4) - ✅ Published
5. [Variables and Outputs](https://dev.to/aws-builders/terraform-variables-and-outputs-making-your-infrastructure-flexible-3ebc) - ✅ Published

### 📗 Real Infrastructure (Articles 6-10)
6. [Building a VPC from Scratch](https://dev.to/aws-builders/building-your-first-vpc-aws-networking-with-terraform-3h34) - ✅ Published
7. [EC2 + Application Load Balancer](https://dev.to/aws-builders/deploy-web-servers-with-terraform-ec2-load-balancer-tutorial-3nh9) - ✅ Published
8. [RDS + Secrets Manager](https://dev.to/aws-builders/secure-database-deployment-rds-secrets-manager-with-terraform-4oc7) - ✅ Published
9. [IAM Roles and Security](https://dev.to/aws-builders/aws-iam-roles-with-terraform-security-best-practices-2h8l) - ✅ Published
10. Lambda Serverless - 🔜 Coming Soon

## 🚀 Getting Started

### ✅ Prerequisites
- AWS Account ([Create Free Account](https://aws.amazon.com/free/))
- Terraform installed (v1.0+)
- AWS CLI configured
- Basic command line knowledge
- Git installed

### ⚡ Quick Start
```bash
# Clone the repository
git clone https://github.com/simplynadaf/terraform-by-sarvar.git
cd terraform-by-sarvar

# Navigate to any article folder
cd articles/03-first-resource/terraform

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration
terraform apply
```

## 📁 Repository Structure

```
terraform-by-sarvar/
├── articles/           # Terraform code organized by article
│   ├── 01-introduction/
│   │   └── terraform/  # Only .tf files
│   ├── 02-installation/
│   │   └── terraform/  # Only .tf files
│   ├── 03-first-resource/
│   │   └── terraform/  # Only .tf files (main.tf)
│   └── ...
├── shared-resources/   # Shared Terraform modules
└── README.md

Note: Articles (.md files) are NOT stored here - they're published on dev.to
```

## 🛠️ Technologies Used

<div align="center">

| Technology | Version | Purpose |
|------------|---------|---------|
| ![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat&logo=terraform&logoColor=white) | v1.14+ | Infrastructure as Code |
| ![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazon-aws&logoColor=white) | - | Cloud Provider |
| ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=github-actions&logoColor=white) | - | CI/CD Pipeline |

**Primary Region:** `us-east-1` (North Virginia)

</div>

## 🔄 Development Workflow

All code in this repository is:
1. ✅ **Tested** on a live AWS environment before publishing
2. ✅ **Verified** to work with the specified Terraform and AWS provider versions
3. ✅ **Documented** with detailed explanations in corresponding articles
4. ✅ **Production-ready** with best practices applied

### 🖥️ Testing Environment
```
OS: Ubuntu 22.04 LTS
Terraform: v1.14.4
AWS Region: us-east-1 (North Virginia)
Version Control: Git + GitHub
```

## 📝 Contributing

This is an educational repository. If you find issues or have suggestions:

1. 🐛 [Open an issue](https://github.com/simplynadaf/terraform-by-sarvar/issues)
2. 🔀 Submit a pull request
3. 💬 Share your feedback

## 👨‍💻 Author

<div align="center">

**Sarvar Nadaf**

[![Portfolio](https://img.shields.io/badge/Portfolio-sarvarnadaf.com-blue?style=for-the-badge&logo=google-chrome&logoColor=white)](https://sarvarnadaf.com)
[![GitHub](https://img.shields.io/badge/GitHub-simplynadaf-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/simplynadaf)
[![dev.to](https://img.shields.io/badge/dev.to-sarvar__04-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/sarvar_04)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-sarvar04-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sarvar04/)
[![Email](https://img.shields.io/badge/Email-simplynadaf%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:simplynadaf@gmail.com)

</div>

## 📄 License

This project is open source and available for educational purposes.

## ⭐ Support

<div align="center">

If you find this series helpful:

⭐ **Star this repository** • 📖 **[Follow the series](https://dev.to/sarvar_04/series/36963)** • 🔗 **Share with others**

[![GitHub stars](https://img.shields.io/github/stars/simplynadaf/terraform-by-sarvar?style=social)](https://github.com/simplynadaf/terraform-by-sarvar)
[![GitHub forks](https://img.shields.io/github/forks/simplynadaf/terraform-by-sarvar?style=social)](https://github.com/simplynadaf/terraform-by-sarvar/fork)

</div>

---

<div align="center">

**Happy Terraforming! 🚀**

Made with ❤️ by [Sarvar Nadaf](https://sarvarnadaf.com)

</div>
