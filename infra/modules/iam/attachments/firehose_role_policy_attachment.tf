# resource "aws_iam_role_policy_attachment" "firehose_attach_policy" {
#   group       = var.data_readers_group_name
#   policy_arn  = var.firehose_access_policy_arn
# }

