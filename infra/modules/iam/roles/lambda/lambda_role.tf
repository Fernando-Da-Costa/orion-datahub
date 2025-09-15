resource "aws_iam_role" "lambda_role" {
  name               = "orion-lambda-role-${var.environment}"
  assume_role_policy = file("${path.module}/trust_policies/trust_lambda.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
    Owner       = "data-platform"
  }
}