resource "aws_iam_role" "firehose_role" {
  name               = "orion-firehose-role-${var.environment}"
  assume_role_policy = file("${path.module}/trust_policies/trust_firehose.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
    Owner       = "data-platform"
  }
}
