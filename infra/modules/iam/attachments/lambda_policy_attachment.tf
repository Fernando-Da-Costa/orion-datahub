resource "aws_iam_role_policy_attachment" "lambda_attach_policy" {
  role       = var.lambda_role_name
  policy_arn = var.lambda_access_policy_arn
}

resource "aws_iam_group_policy_attachment" "attach_lambda_access" {
  group      = var.data_readers_group_name
  policy_arn = var.lambda_access_policy_arn
}
