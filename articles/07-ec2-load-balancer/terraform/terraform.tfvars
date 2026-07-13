aws_region = "us-east-1"
project_name = "terraform-web"
environment = "dev"

# Network Configuration
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"

# EC2 Configuration
instance_type = "t2.micro"
instance_count = 2
key_name = "my-key"

# Security - Change this to your IP address
my_ip = "0.0.0.0/0"
