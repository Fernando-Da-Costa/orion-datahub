resource "aws_iam_group_policy_attachment" "attach_lakeformation_access" {
  group      = var.data_readers_group_name
  policy_arn = var.lakeformation_access_policy_arn
}
