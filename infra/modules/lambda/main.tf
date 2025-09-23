resource "aws_lambda_function" "this" {
  function_name = var.lambda_config.function_name
  handler       = var.lambda_config.handler
  runtime       = var.lambda_config.runtime
  role          = var.lambda_config.iam_role_arn
  filename      = "${path.module}/../../../Function_Lambda/${var.lambda_config.filename}"

  environment {
    variables = var.lambda_config.environment_vars
  }
}




resource "aws_cloudwatch_event_rule" "schedule" {
  name                = "${var.lambda_config.function_name}-schedule"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  target_id = "lambda"
  arn       = aws_lambda_function.this.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule.arn
}
