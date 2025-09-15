resource "aws_iam_role_policy_attachment" "lambda_attach_policy" {
  role       = var.lambda_role_name
  policy_arn = var.lambda_access_policy_arn
}

