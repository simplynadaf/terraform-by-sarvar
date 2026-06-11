# S3 Bucket Output
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.app_bucket.id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.app_bucket.arn
}

# IAM Role Outputs
output "ec2_role_name" {
  description = "EC2 IAM role name"
  value       = aws_iam_role.ec2_role.name
}

output "ec2_role_arn" {
  description = "EC2 IAM role ARN"
  value       = aws_iam_role.ec2_role.arn
}

output "lambda_role_name" {
  description = "Lambda IAM role name"
  value       = aws_iam_role.lambda_role.name
}

# EC2 Output
output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.app.public_ip
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

# Test Commands
output "test_commands" {
  description = "Commands to test IAM permissions"
  value = <<-EOT
    SSH to EC2:
    ssh -i ${var.key_name}.pem ec2-user@${aws_instance.app.public_ip}
    
    Test S3 access:
    aws s3 ls s3://${aws_s3_bucket.app_bucket.id}
    aws s3 cp test.txt s3://${aws_s3_bucket.app_bucket.id}/
    
    Test CloudWatch:
    aws cloudwatch put-metric-data --namespace TestApp --metric-name TestMetric --value 1
  EOT
}
