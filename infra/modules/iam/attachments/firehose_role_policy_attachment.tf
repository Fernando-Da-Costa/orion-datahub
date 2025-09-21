resource "aws_iam_role_policy_attachment" "firehose_attach_policy" {
  role       = var.firehose_role_name
  policy_arn = var.firehose_access_policy_arn
}
