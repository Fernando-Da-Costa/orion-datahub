resource "aws_iam_policy" "kinesis_access" {
  name   = "OrionKinesisAccessPolicy"
  policy = file("${path.module}/policies/kinesis_access_policy.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
  }
}
