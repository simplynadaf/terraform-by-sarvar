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

# Create two S3 buckets
resource "aws_s3_bucket" "logs" {
  bucket = "my-app-logs-sarvar-2026"
  
  tags = {
    Name        = "Application Logs"
    Environment = "Development"
    Purpose     = "Logging"
  }
}

resource "aws_s3_bucket" "backups" {
  bucket = "my-app-backups-sarvar-2026"
  
  tags = {
    Name        = "Application Backups"
    Environment = "Development"
    Purpose     = "Backup Storage"
  }
}

# Outputs
output "logs_bucket_id" {
  value = aws_s3_bucket.logs.id
}

output "backups_bucket_id" {
  value = aws_s3_bucket.backups.id
}
