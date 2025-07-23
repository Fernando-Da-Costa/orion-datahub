resource "aws_lambda_function" "ingest_api" {
  function_name = "ingest-api-to-bronze"
  role          = aws_iam_role.lambda_ingest_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = {
      BUCKET = "orion-datahub-bronze-dev"
    }
  }

  tags = {
    Project = "orion-datahub"
    Layer   = "bronze"
  }
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.ingest_api.function_name}"
  retention_in_days = 30
}
