output "glue_role_arn" {
  value = module.glue_role.glue_role_arn
}
output "lambda_role_arn" {
  value = module.lambda_role.lambda_role_arn
}

# output "full_access_policy_arn" {
#   value = aws_iam_policy.full_access_policy.arn
# }