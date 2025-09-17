variable "environment" {
  description = "Ambiente: dev, staging, prod"
  type        = string
}
variable "iam_user_name" {
  type = string
}

variable "region" {
  type        = string
  description = "Região AWS"
}

variable "account_id" {
  type        = string
  description = "ID da conta AWS"
}

variable "function_name" {
  type = string
}


variable "kinesis_stream_name" {
  type = map(string)
}


