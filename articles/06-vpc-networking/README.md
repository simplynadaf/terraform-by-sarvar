# Article 6: Building a VPC - AWS Networking with Terraform

## Status
- **Written:** ✅ Complete
- **Tested:** ⏳ Pending
- **Published:** ❌ Not yet

## Article Information

- **Title:** Building Your First VPC: AWS Networking with Terraform
- **Focus:** Production-ready VPC with public/private subnets, multi-AZ
- **Difficulty:** Intermediate
- **Time to Read:** 20-25 minutes
- **Time to Practice:** 45 minutes
- **Word Count:** ~4,000 words

## What This Article Teaches

### Concepts
- VPC fundamentals (CIDR blocks, subnets, routing)
- Public vs Private subnets
- Internet Gateway and NAT Gateway
- Route tables and associations
- Data sources in Terraform
- Resource dependencies (implicit and explicit)
- Multi-AZ architecture for high availability

### Infrastructure Created
- 1 VPC (10.0.0.0/16)
- 2 Public Subnets (10.0.1.0/24, 10.0.2.0/24)
- 2 Private Subnets (10.0.11.0/24, 10.0.12.0/24)
- 1 Internet Gateway
- 1 NAT Gateway
- 1 Elastic IP
- 2 Route Tables (public and private)
- 4 Route Table Associations

### Skills Learned
- Creating production-ready VPC
- Configuring networking components
- Using data sources to fetch AWS information
- Managing complex multi-resource infrastructure
- Understanding AWS networking costs
- Building multi-AZ architecture

## Files in This Directory

- `article.md` - The complete article
- `APPROACH.md` - Writing approach and structure
- `TESTING_STEPS.md` - Step-by-step testing guide
- `terraform/` - All Terraform code
  - `main.tf` - Main infrastructure code
  - `variables.tf` - Input variables
  - `outputs.tf` - Output values
  - `terraform.tfvars` - Variable values
  - `README.md` - Code documentation

## Cost Warning ⚠️

**NAT Gateway costs $0.045/hour (~$32/month)**

This article emphasizes:
- Clear cost warnings throughout
- Immediate destruction after testing
- Production vs learning considerations

## Testing Checklist

- [ ] Start EC2 testing server
- [ ] SSH into server
- [ ] Create project directory
- [ ] Copy all Terraform files
- [ ] Run terraform init
- [ ] Run terraform plan (verify 15 resources)
- [ ] Run terraform apply
- [ ] Verify outputs
- [ ] Check AWS Console
- [ ] Verify multi-AZ setup
- [ ] Test state commands
- [ ] Run terraform destroy
- [ ] Verify all resources deleted
- [ ] Check no NAT Gateway charges

## Key Features

### New Concepts Introduced
1. **Data Sources** - Reading information from AWS
2. **Resource Dependencies** - Implicit and explicit
3. **Multi-AZ Architecture** - High availability
4. **Complex Networking** - Multiple interconnected resources

### Best Practices Covered
- CIDR planning
- Multi-AZ for high availability
- Tagging strategy
- Public/private subnet separation
- Variable usage for flexibility
- Cost awareness

### Common Issues Addressed
- NAT Gateway creation timeout
- Elastic IP limits
- Route table associations
- CIDR block overlaps
- Cost management

## Article Structure

1. **Hook** - Networking confusion problem
2. **Theory** - VPC fundamentals explained simply
3. **Architecture** - What we'll build
4. **Step-by-Step** - Building the VPC
5. **Code Explanation** - Understanding each component
6. **Deployment** - Running the code
7. **Verification** - Checking the infrastructure
8. **Dependencies** - Understanding resource relationships
9. **Costs** - Detailed cost breakdown
10. **Best Practices** - Production-ready patterns
11. **Troubleshooting** - Common issues and solutions
12. **Cleanup** - Destroying resources
13. **Summary** - What was learned
14. **Challenge** - Extension exercises
15. **Next Steps** - Preview of Article 7

## Links to Update Before Publishing

- [ ] Link to Article 5 (Variables and Outputs)
- [ ] Link to dev.to series
- [ ] Link to GitHub repo
- [ ] Link to AWS documentation
- [ ] Link to CIDR calculator

## Screenshots Needed

1. VPC created in AWS Console
2. Subnets list (showing public/private, different AZs)
3. Internet Gateway attached to VPC
4. NAT Gateway in public subnet
5. Route tables with routes
6. Subnet associations
7. terraform plan output
8. terraform apply success
9. terraform output results
10. Resource map in AWS Console

## Pre-Publishing Checklist

- [ ] All code tested on server
- [ ] Screenshots captured
- [ ] Links verified
- [ ] Typos checked
- [ ] Code formatted correctly
- [ ] Cost warnings prominent
- [ ] Destroy instructions clear
- [ ] TESTING_RESULTS.md created
- [ ] Article reviewed
- [ ] Ready for publication

## Next Article Preview

**Article 7: EC2 Instances and Load Balancers**
- Deploy EC2 instances in this VPC
- Configure security groups
- Create Application Load Balancer
- Set up health checks
- Test complete web application

## Notes

- This is the first article with complex multi-resource infrastructure
- Emphasizes production-ready patterns
- Strong focus on costs (NAT Gateway)
- Introduces data sources concept
- Foundation for all future networking articles
