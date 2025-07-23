output "data_readers_name" {
  value = aws_iam_group.data_readers.name
}
output "athena_admins_group_arn" {
  description = "ARN do grupo IAM para administração do Athena"
  value       = aws_iam_group.data_readers.arn
}
