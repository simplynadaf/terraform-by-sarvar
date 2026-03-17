# Production Environment Configuration
aws_region     = "us-east-1"
bucket_name    = "terraform-variables-prod-sarvar-2026"
bucket_prefix  = "terraform-prod"
bucket_count   = 3
enable_versioning = true

common_tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "Variables Tutorial"
  Owner       = "Sarvar"
  CostCenter  = "Production"
  Compliance  = "Required"
}

environment = "prod"
