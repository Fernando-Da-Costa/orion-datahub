resource "aws_iam_policy" "glue_access" {
  name        = "OrionGlueAccessPolicy-${var.environment}"
  description = "Permissões mínimas para AWS Glue Jobs em ${var.environment}"
  policy      = file("${path.module}/policies/glue_access_policy.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
  }
}
