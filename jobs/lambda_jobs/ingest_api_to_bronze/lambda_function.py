import json
import boto3
import requests
from datetime import datetime

s3 = boto3.client('s3')

def lambda_handler(event, context):
    response = requests.get("https://api.exemplo.com/dados", headers={"Authorization": "Bearer TOKEN"})
    
    if response.status_code != 200:
        raise Exception(f"Erro ao acessar API: {response.status_code}")
    
    data = response.json()
    now = datetime.utcnow()
    bucket = "orion-datahub-bronze-dev"
    prefix = f"api/exemplo/ano={now.year}/mes={now.month:02}/dia={now.day:02}/"
    key = prefix + "dados.json"

    s3.put_object(
        Bucket=bucket,
        Key=key,
        Body=json.dumps(data),
        ContentType="application/json"
    )

    return {
        "statusCode": 200,
        "body": f"Dados armazenados com sucesso em: s3://{bucket}/{key}"
    }
