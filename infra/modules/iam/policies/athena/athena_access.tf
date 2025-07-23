resource "aws_iam_policy" "athena_access" {
  name        = "OrionAthenaAccessPolicy"
  description = "Permissões mínimas para AWS Athena."
  policy      = file("${path.module}/policies/athena_access_policy.json")

  tags = {
    Environment = var.environment
    Project     = "orion-datahub"
  }
}
