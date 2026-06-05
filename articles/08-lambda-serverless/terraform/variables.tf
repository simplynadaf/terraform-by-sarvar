variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "terraform-lambda"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Lambda triggers"
  type        = string
  default     = "terraform-lambda-demo-2026"
}
