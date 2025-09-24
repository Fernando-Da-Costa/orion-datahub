resource "aws_iam_role_policy_attachment" "glue_logs" {
  role       = var.glue_role_name
  policy_arn = var.glue_access_policy_arn
}
