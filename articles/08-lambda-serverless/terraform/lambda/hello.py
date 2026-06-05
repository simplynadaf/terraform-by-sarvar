import json

def lambda_handler(event, context):
    """
    Simple Hello World Lambda function
    """
    print(f"Event received: {json.dumps(event)}")
    
    # Get name from query parameters or use default
    name = "World"
    if event.get('queryStringParameters'):
        name = event['queryStringParameters'].get('name', 'World')
    
    response_body = {
        'message': f'Hello, {name}!',
        'timestamp': context.aws_request_id,
        'function_name': context.function_name,
        'memory_limit': context.memory_limit_in_mb
    }
    
    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps(response_body)
    }
