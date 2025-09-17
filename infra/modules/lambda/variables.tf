variable "function_name" {}
variable "handler" {}
variable "runtime" {}
variable "schedule_expression" {}

variable "iam_role_arn" {}
variable "include_pandas_layer" {
  default = false
}
variable "region" {}
variable "include_requests_layer" {
  default = false
}

variable "lambda_config" {
  type = object({
    function_name     = string
    handler           = string
    runtime           = string
    iam_role_arn      = string
    filename          = string
    environment_vars  = map(string)
  })
}

