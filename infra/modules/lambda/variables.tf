variable "function_name" {}
variable "handler" {}
variable "runtime" {}
variable "schedule_expression" {}
variable "environment_vars" {
  type = map(string)
}
variable "iam_role_arn" {}
