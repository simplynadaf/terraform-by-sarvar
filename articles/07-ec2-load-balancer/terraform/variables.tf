# AWS Region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

# Project Name
variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "terraform-web"
}

# Environment
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public Subnet CIDR
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Instance Count
variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

# SSH Key Name
variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "my-key"
}

# My IP for SSH Access
variable "my_ip" {
  description = "Your IP address for SSH access (CIDR format)"
  type        = string
  default     = "0.0.0.0/0"  # Change this to your IP for security
}
