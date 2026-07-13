# Default configuration for development environment
aws_region = "us-east-1"
project_name = "terraform-vpc"
environment = "dev"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"

# Subnets
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.11.0/24"
