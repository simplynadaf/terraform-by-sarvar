# Development Environment Configuration
aws_region     = "us-east-1"
bucket_name    = "terraform-variables-dev-sarvar-2026"
bucket_prefix  = "terraform-dev"
bucket_count   = 2
enable_versioning = false

common_tags = {
  Environment = "Development"
  ManagedBy   = "Terraform"
  Project     = "Variables Tutorial"
  Owner       = "Sarvar"
  CostCenter  = "Learning"
}

environment = "dev"
