resource "aws_iam_policy" "lakeformation_access" {
  name   = "OrionLakeformationAccessPolicy"
  policy = file("${path.module}/policies/lakeformation_access_policy.json")
}