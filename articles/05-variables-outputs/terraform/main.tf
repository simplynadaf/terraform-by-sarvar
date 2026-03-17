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
  region = var.aws_region
}

# S3 bucket with variables
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = merge(
    var.common_tags,
    {
      Name = var.bucket_name
    }
  )
}

# Bucket versioning (conditional based on variable)
resource "aws_s3_bucket_versioning" "example" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Multiple buckets using count
resource "aws_s3_bucket" "multiple" {
  count  = var.bucket_count
  bucket = "${var.bucket_prefix}-${count.index + 1}"

  tags = var.common_tags
}
