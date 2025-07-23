resource "aws_iam_group_policy_attachment" "attach_s3_read" {
  group      = var.data_readers_group_name
  policy_arn = var.s3_read_policy_arn
}

resource "aws_iam_group_policy_attachment" "attach_glue_access" {
  group      = var.data_readers_group_name
  policy_arn = var.glue_access_policy_arn
}

