resource "aws_iam_role" "glue_role" {
  name               = "orion-glue-role-${var.environment}"
  assume_role_policy = file("${path.module}/trust_policies/trust_glue.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
    Owner       = "data-platform"
  }
}
