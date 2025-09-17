variable "app_name" {
  type        = string
  description = "Nome do aplicativo Kinesis Analytics"
}

variable "execution_role_arn" {
  type        = string
  description = "ARN da role de execução"
}

variable "input_stream_arn" {
  type        = string
  description = "ARN do Kinesis Stream de entrada"
}

variable "firehose_arn" {
  type        = string
  description = "ARN do Firehose de saída"
}
variable "kinesis_analytics_name" { 
  type        = string
  description = "Nome do Kinesis Analytics"
}
