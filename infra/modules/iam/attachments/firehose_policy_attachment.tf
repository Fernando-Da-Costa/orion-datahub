resource "aws_iam_role_policy_attachment" "attach_firehose_policy" {
  role       = var.firehose_role_name
  policy_arn = var.firehose_access_policy_arn 
}
resource "aws_iam_group_policy_attachment" "attach_firehose_policy" {
  group      = var.data_readers_group_name
  policy_arn = var.firehose_access_policy_arn 
}
