
variable "glue_role_name" {
  description = "Nome do role do Glue"
  type        = string
}

variable "data_readers_group_name" {
  description = "Nome do grupo IAM data_readers"
  type        = string
}

variable "s3_read_policy_arn" {
  description = "ARN da policy de leitura S3"
  type        = string
}

variable "glue_access_policy_arn" {
  description = "ARN da policy de acesso Glue"
  type        = string
}

variable "athena_access_policy_arn" {
  description = "ARN da policy de acesso ao Athena"
  type        = string
}

