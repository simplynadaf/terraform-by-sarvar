terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# S3 Bucket
resource "aws_s3_bucket" "app_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEC2RoleAccess"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.ec2_role.arn
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.app_bucket.arn,
          "${aws_s3_bucket.app_bucket.arn}/*"
        ]
      },
      {
        Sid    = "DenyUnencryptedUploads"
        Effect = "Deny"
        Principal = "*"
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.app_bucket.arn}/*"
        Condition = {
          StringNotEquals = {
            "s3:x-amz-server-side-encryption" = "AES256"
          }
        }
      }
    ]
  })
}

# IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = {
    Name = "${var.project_name}-ec2-role"
  }
}

# Custom IAM Policy for S3 Access
resource "aws_iam_policy" "s3_access" {
  name        = "${var.project_name}-s3-access"
  description = "Allow S3 access for application"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.app_bucket.arn,
          "${aws_s3_bucket.app_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Attach S3 Policy to EC2 Role
resource "aws_iam_role_policy_attachment" "ec2_s3" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access.arn
}

# Attach CloudWatch Policy
resource "aws_iam_role_policy_attachment" "ec2_cloudwatch" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Attach SSM Policy (for Session Manager)
resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

  tags = {
    Name = "${var.project_name}-lambda-role"
  }
}

# Lambda Basic Execution Policy
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Custom Lambda Policy for S3 Read-Only
resource "aws_iam_policy" "lambda_s3_read" {
  name        = "${var.project_name}-lambda-s3-read"
  description = "Allow Lambda to read from S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:ListBucket"
      ]
      Resource = [
        aws_s3_bucket.app_bucket.arn,
        "${aws_s3_bucket.app_bucket.arn}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_s3" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_s3_read.arn
}

# Security Group for EC2
resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "Security group for EC2"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}

# EC2 Instance
resource "aws_instance" "app" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.ec2.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y aws-cli
              
              # Create test file
              echo "Hello from Terraform IAM Demo" > /home/ec2-user/test.txt
              chown ec2-user:ec2-user /home/ec2-user/test.txt
              
              # Create helper scripts
              cat > /home/ec2-user/test-s3.sh <<'SCRIPT'
              #!/bin/bash
              echo "Testing S3 Access..."
              
              # List bucket
              echo "1. Listing bucket contents:"
              aws s3 ls s3://${var.s3_bucket_name}/
              
              # Upload file
              echo "2. Uploading test file:"
              aws s3 cp /home/ec2-user/test.txt s3://${var.s3_bucket_name}/test.txt
              
              # Download file
              echo "3. Downloading file:"
              aws s3 cp s3://${var.s3_bucket_name}/test.txt /home/ec2-user/downloaded.txt
              
              echo "S3 test complete!"
SCRIPT
              
              chmod +x /home/ec2-user/test-s3.sh
              chown ec2-user:ec2-user /home/ec2-user/test-s3.sh
              
              # Create IAM info script
              cat > /home/ec2-user/show-iam-info.sh <<'SCRIPT'
              #!/bin/bash
              echo "=== IAM Role Information ==="
              echo "Instance Profile:"
              curl -s http://169.254.169.254/latest/meta-data/iam/info | jq .
              
              echo -e "\n=== Current IAM Identity ==="
              aws sts get-caller-identity
              
              echo -e "\n=== Attached Policies ==="
              ROLE_NAME=$(aws sts get-caller-identity --query Arn --output text | cut -d'/' -f2)
              aws iam list-attached-role-policies --role-name $ROLE_NAME 2>/dev/null || echo "Cannot list policies (expected)"
SCRIPT
              
              chmod +x /home/ec2-user/show-iam-info.sh
              chown ec2-user:ec2-user /home/ec2-user/show-iam-info.sh
              EOF

  tags = {
    Name        = "${var.project_name}-instance"
    Environment = var.environment
  }
}
