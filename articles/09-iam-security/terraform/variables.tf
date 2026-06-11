variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "terraform-iam"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "s3_bucket_name" {
  description = "S3 bucket name (must be globally unique)"
  type        = string
  default     = "terraform-iam-demo-bucket-2026"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "my-key"
}

variable "my_ip" {
  description = "Your IP for SSH"
  type        = string
  default     = "0.0.0.0/0"
}
