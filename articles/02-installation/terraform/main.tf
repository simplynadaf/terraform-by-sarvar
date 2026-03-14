# Terraform Installation Verification
# This is a simple test to verify your Terraform and AWS setup

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

# Data source to verify AWS credentials are working
data "aws_caller_identity" "current" {}

# Data source to get current AWS region
data "aws_region" "current" {}

# Outputs to display your AWS account information
output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "Your AWS Account ID"
}

output "caller_arn" {
  value       = data.aws_caller_identity.current.arn
  description = "ARN of the AWS identity making the call"
}

output "caller_user" {
  value       = data.aws_caller_identity.current.user_id
  description = "User ID of the AWS identity"
}

output "region" {
  value       = data.aws_region.current.name
  description = "AWS Region you're connected to"
}
