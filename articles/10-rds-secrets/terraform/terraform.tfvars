aws_region = "us-east-1"
project_name = "terraform-db"
environment = "dev"

# Network Configuration
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_1_cidr = "10.0.11.0/24"
private_subnet_2_cidr = "10.0.12.0/24"

# Database Configuration
db_name = "myappdb"
db_username = "admin"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20

# EC2 Configuration
instance_type = "t2.micro"
key_name = "my-key"
my_ip = "0.0.0.0/0"
