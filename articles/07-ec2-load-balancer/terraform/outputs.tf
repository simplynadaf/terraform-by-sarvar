# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

# Subnet Output
output "public_subnet_id" {
  description = "ID of public subnet"
  value       = aws_subnet.public.id
}

# EC2 Instance Outputs
output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = aws_instance.web[*].id
}

output "instance_public_ips" {
  description = "Public IPs of EC2 instances"
  value       = aws_instance.web[*].public_ip
}

# Load Balancer Outputs
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_url" {
  description = "URL to access the load balancer"
  value       = "http://${aws_lb.main.dns_name}"
}

# Security Group Outputs
output "alb_security_group_id" {
  description = "ID of ALB security group"
  value       = aws_security_group.alb.id
}

output "instance_security_group_id" {
  description = "ID of instance security group"
  value       = aws_security_group.instance.id
}
