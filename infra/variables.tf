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


variable "kinesis_analytics_name" {
  type = string
}


variable "firehose_name" {
  type        = string
  description = "Nome do Kinesis Firehose Delivery Stream"
  default     = "orion-datahub-firehose" 
}

variable "firehose_streams" {
  type = map(object({
    prefix     = string
    bucket_arn = string
  }))
}

