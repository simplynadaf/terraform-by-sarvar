# Lambda Function Outputs
output "hello_lambda_arn" {
  description = "Hello Lambda function ARN"
  value       = aws_lambda_function.hello.arn
}

output "hello_lambda_name" {
  description = "Hello Lambda function name"
  value       = aws_lambda_function.hello.function_name
}

output "s3_processor_lambda_arn" {
  description = "S3 Processor Lambda ARN"
  value       = aws_lambda_function.s3_processor.arn
}

# API Gateway Outputs
output "api_gateway_url" {
  description = "API Gateway invoke URL"
  value       = "${aws_api_gateway_deployment.main.invoke_url}${aws_api_gateway_stage.main.stage_name}/hello"
}

output "api_gateway_id" {
  description = "API Gateway ID"
  value       = aws_api_gateway_rest_api.main.id
}

# S3 Bucket Output
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.lambda_trigger.id
}

# Test Commands
output "test_commands" {
  description = "Commands to test Lambda functions"
  value = <<-EOT
    Test API Gateway:
    curl ${aws_api_gateway_deployment.main.invoke_url}${aws_api_gateway_stage.main.stage_name}/hello
    
    Test S3 trigger:
    echo "Test file" > test.txt
    aws s3 cp test.txt s3://${aws_s3_bucket.lambda_trigger.id}/test.txt
    
    View logs:
    aws logs tail /aws/lambda/${aws_lambda_function.hello.function_name} --follow
    aws logs tail /aws/lambda/${aws_lambda_function.s3_processor.function_name} --follow
  EOT
}
