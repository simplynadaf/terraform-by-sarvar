# Article 7: EC2 + Load Balancer - Terraform Code

This directory contains the Terraform code for deploying web servers with an Application Load Balancer.

## Quick Start

```bash
# 1. Create SSH key pair (if you don't have one)
aws ec2 create-key-pair \
  --key-name my-key \
  --query 'KeyMaterial' \
  --output text > my-key.pem
chmod 400 my-key.pem

# 2. Update terraform.tfvars with your IP
# Get your IP: curl ifconfig.me
# Edit: my_ip = "YOUR_IP/32"

# 3. Initialize Terraform
terraform init

# 4. Deploy
terraform apply

# 5. Get load balancer URL
terraform output alb_url

# 6. Test in browser or with curl
curl $(terraform output -raw alb_url)

# 7. Clean up when done
terraform destroy
```

## What Gets Created

- **VPC:** 10.0.0.0/16
- **Public Subnet:** 10.0.1.0/24
- **EC2 Instances:** 2x t2.micro with Apache
- **Load Balancer:** Application Load Balancer
- **Security Groups:** ALB and Instance security groups

## Customization

Edit `terraform.tfvars`:

```hcl
# Change number of instances
instance_count = 3

# Change instance type
instance_type = "t3.micro"

# Restrict SSH access
my_ip = "203.0.113.0/32"
```

## Outputs

After `terraform apply`, you'll see:

```
alb_url = "http://terraform-web-alb-xxx.elb.amazonaws.com"
instance_ids = ["i-xxx", "i-yyy"]
instance_public_ips = ["1.2.3.4", "5.6.7.8"]
```

## Testing Load Balancing

```bash
# Test multiple times - you'll see different servers
for i in {1..10}; do
  curl -s $(terraform output -raw alb_url) | grep "Server:"
  sleep 1
done
```

## Cost

- **t2.micro instances:** Free tier eligible (750 hours/month)
- **ALB:** ~$16.20/month
- **Total with free tier:** ~$16/month

## Troubleshooting

**503 Service Unavailable:**
- Wait 2-3 minutes for instances to boot
- Check health: `aws elbv2 describe-target-health --target-group-arn <arn>`

**Can't access ALB:**
- Check security group allows port 80 from 0.0.0.0/0
- Verify instances are healthy

**Can't SSH:**
- Update `my_ip` variable with your IP
- Verify key pair exists: `aws ec2 describe-key-pairs`

## Next Steps

See the [full article](../article.md) for detailed explanations and advanced topics.
