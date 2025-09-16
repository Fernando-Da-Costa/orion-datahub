resource "aws_iam_policy" "lambda_access" {
  name        = "OrionLambdaAccessPolicy-${var.environment}"
  description = "Permissões mínimas para AWS Lambda em ${var.environment}"
  policy      = file("${path.module}/policies/lambda_access_policy.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
  }
}
