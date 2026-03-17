# String variable
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for multiple bucket names"
  type        = string
  default     = "terraform-demo"
}

# Number variable
variable "bucket_count" {
  description = "Number of S3 buckets to create"
  type        = number
  default     = 2
  
  validation {
    condition     = var.bucket_count >= 1 && var.bucket_count <= 5
    error_message = "Bucket count must be between 1 and 5."
  }
}

# Boolean variable
variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = false
}

# List variable
variable "allowed_ips" {
  description = "List of IP addresses allowed to access the bucket"
  type        = list(string)
  default     = []
}

# Map variable
variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Project     = "Learning"
  }
}

# Environment variable
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}
