resource "aws_iam_group_policy_attachment" "attach_kinesis_access" {
  group       = var.data_readers_group_name
  policy_arn  = var.kinesis_access_policy_arn 
}
