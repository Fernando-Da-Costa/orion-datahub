resource "aws_iam_policy" "firehose_access" {
  name        = "OrionFirehoseAccessPolicy-${var.environment}"
  description = "Permissões mínimas para AWS Firehose Delivery Streams em ${var.environment}"
  policy      = file("${path.module}/policies/firehose_access_policy.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
  }
}
