resource "aws_iam_policy" "s3_read" {
  name   = "OrionS3ReadOnlyPolicy"
  policy = file("${path.module}/policies/s3_read_policy.json")
}
