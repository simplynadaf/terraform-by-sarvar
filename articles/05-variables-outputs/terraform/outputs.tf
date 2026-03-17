# Basic outputs
output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "Region where the bucket was created"
  value       = aws_s3_bucket.example.region
}

output "bucket_domain_name" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.example.bucket_domain_name
}

# Multiple buckets output
output "multiple_bucket_names" {
  description = "Names of all created buckets"
  value       = aws_s3_bucket.multiple[*].id
}

# Conditional output
output "versioning_enabled" {
  description = "Whether versioning is enabled"
  value       = var.enable_versioning
}

# Map output
output "bucket_tags" {
  description = "Tags applied to the bucket"
  value       = aws_s3_bucket.example.tags
}

# Sensitive output example (for demonstration)
output "bucket_id_sensitive" {
  description = "Bucket ID (marked as sensitive)"
  value       = aws_s3_bucket.example.id
  sensitive   = true
}
