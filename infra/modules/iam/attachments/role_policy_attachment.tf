resource "aws_iam_role_policy_attachment" "glue_attach_policy" {
  role       = var.glue_role_name
  policy_arn = var.glue_access_policy_arn
}

