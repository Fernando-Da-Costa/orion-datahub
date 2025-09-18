output "glue_role_arn" {
  value = module.glue_role.glue_role_arn
}
output "lambda_role_arn" {
  value = module.lambda_role.lambda_role_arn
}
output "firehose_role_arn" {
  value = module.firehose_role.firehose_role_arn
}

