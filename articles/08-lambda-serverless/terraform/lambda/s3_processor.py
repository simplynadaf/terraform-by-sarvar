import json
import urllib.parse

def lambda_handler(event, context):
    """
    Process files uploaded to S3
    """
    print(f"Event received: {json.dumps(event)}")
    
    # Get S3 event details
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = urllib.parse.unquote_plus(record['s3']['object']['key'])
        size = record['s3']['object']['size']
        event_name = record['eventName']
        
        print(f"Processing file: {key}")
        print(f"Bucket: {bucket}")
        print(f"Size: {size} bytes")
        print(f"Event: {event_name}")
        
        # Here you would process the file
        # For demo, we just log the information
        
        result = {
            'status': 'processed',
            'file': key,
            'bucket': bucket,
            'size': size
        }
        
        print(f"Result: {json.dumps(result)}")
    
    return {
        'statusCode': 200,
        'body': json.dumps('File processed successfully')
    }
