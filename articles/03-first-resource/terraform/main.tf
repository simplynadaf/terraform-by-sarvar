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

# S3 Bucket resource
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "terraform-series-first-bucket-2026"
  
  tags = {
    Name        = "My First Terraform Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    Project     = "Terraform-Series"
  }
}

# Outputs
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
  description = "The AWS region where bucket is created"
}
