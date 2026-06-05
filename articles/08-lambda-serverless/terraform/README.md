# Article 10: Lambda Serverless - Terraform Code

Deploy serverless applications with Lambda, API Gateway, and S3 triggers.

## Quick Start

```bash
# 1. Update bucket name in terraform.tfvars
s3_bucket_name = "your-unique-bucket-name-2026"

# 2. Deploy
terraform init
terraform apply

# 3. Test API Gateway
curl $(terraform output -raw api_gateway_url)
curl "$(terraform output -raw api_gateway_url)?name=YourName"

# 4. Test S3 trigger
echo "Hello Lambda" > test.txt
aws s3 cp test.txt s3://$(terraform output -raw s3_bucket_name)/test.txt

# 5. View logs
aws logs tail /aws/lambda/terraform-lambda-s3-processor --follow

# 6. Cleanup
terraform destroy
```

## Lambda Functions

### hello.py
- Simple HTTP API endpoint
- Accepts query parameter `name`
- Returns JSON response
- Memory: 128 MB
- Timeout: 10 seconds

### s3_processor.py
- Triggered by S3 ObjectCreated events
- Processes .txt files only
- Logs file information
- Memory: 256 MB
- Timeout: 30 seconds

## Architecture

```
API Gateway (GET /hello)
    ↓
Lambda (hello.py)
    ↓
CloudWatch Logs

S3 Bucket (*.txt upload)
    ↓
Lambda (s3_processor.py)
    ↓
CloudWatch Logs
```

## Testing

### Test API Gateway
```bash
# Basic test
curl $(terraform output -raw api_gateway_url)

# With parameter
curl "$(terraform output -raw api_gateway_url)?name=Terraform"

# Expected response
{
  "message": "Hello, Terraform!",
  "timestamp": "...",
  "function_name": "terraform-lambda-hello",
  "memory_limit": "128"
}
```

### Test S3 Trigger
```bash
# Upload file
echo "Test content" > test.txt
aws s3 cp test.txt s3://YOUR-BUCKET/test.txt

# Check logs (wait 10 seconds)
aws logs tail /aws/lambda/terraform-lambda-s3-processor --since 1m

# Expected output
Processing file: test.txt
Bucket: YOUR-BUCKET
Size: 13 bytes
Event: ObjectCreated:Put
```

### Monitor Invocations
```bash
# View all logs
aws logs tail /aws/lambda/terraform-lambda-hello --follow

# Get metrics
aws cloudwatch get-metric-statistics \
  --namespace AWS/Lambda \
  --metric-name Invocations \
  --dimensions Name=FunctionName,Value=terraform-lambda-hello \
  --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%S) \
  --end-time $(date -u +%Y-%m-%dT%H:%M:%S) \
  --period 300 \
  --statistics Sum
```

## Customization

### Change Runtime
```hcl
runtime = "python3.12"  # or nodejs20.x, java17, etc.
```

### Add Environment Variables
```hcl
environment {
  variables = {
    DB_HOST = "mydb.example.com"
    API_KEY = "secret"
  }
}
```

### Increase Memory/Timeout
```hcl
memory_size = 512  # MB (128-10240)
timeout     = 60   # seconds (1-900)
```

### Add More API Endpoints
```hcl
resource "aws_api_gateway_resource" "users" {
  path_part = "users"
}

resource "aws_api_gateway_method" "users_post" {
  http_method = "POST"
}
```

## Lambda Packaging

### Single File
```hcl
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda/function.py"
  output_path = "lambda/function.zip"
}
```

### Multiple Files
```hcl
data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "lambda/"
  output_path = "lambda.zip"
}
```

### With Dependencies
```bash
# Install dependencies
pip install -r requirements.txt -t lambda/

# Terraform will zip everything
```

## Cost Optimization

**Free Tier:**
- 1M requests/month
- 400,000 GB-seconds compute
- Always free!

**Pricing (after free tier):**
- Requests: $0.20 per 1M
- Compute: $0.0000166667 per GB-second

**Example (100K requests/month, 128MB, 100ms):**
- Requests: 100,000 × $0.0000002 = $0.02
- Compute: 100,000 × 0.1s × 0.125GB × $0.0000166667 = $0.02
- **Total: $0.04/month**

## Troubleshooting

**Lambda not invoked by S3:**
```bash
# Check notification config
aws s3api get-bucket-notification-configuration --bucket YOUR-BUCKET

# Check Lambda permission
aws lambda get-policy --function-name terraform-lambda-s3-processor
```

**API Gateway 502 error:**
```bash
# Check Lambda logs
aws logs tail /aws/lambda/terraform-lambda-hello

# Test Lambda directly
aws lambda invoke --function-name terraform-lambda-hello output.json
cat output.json
```

**Code changes not deployed:**
```bash
# Force update
terraform taint aws_lambda_function.hello
terraform apply
```

## Security Best Practices

✅ **Implemented:**
- IAM role with least privilege
- CloudWatch Logs enabled
- No hardcoded credentials
- S3 bucket not public

🔒 **For Production:**
- Add API Gateway authentication
- Enable API Gateway logging
- Use Lambda layers for dependencies
- Implement error handling
- Add dead letter queues
- Enable X-Ray tracing

## Next Steps

See the [full article](../article.md) for:
- Detailed explanations
- Advanced patterns
- Error handling
- Production best practices
