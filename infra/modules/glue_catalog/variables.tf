variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
}
variable "iam_role_arn" {
  type = string
}
variable "glue_role_arn" {
  type = string
}
variable "name_database" {
  type        = string
  description = "name the database"
}

# variable "script_path" {
#   type = string
# }

# variable "s3_input_path" {
#   type = string
# }

# variable "s3_output_path" {
#   type = string
# }

# variable "bucket_script" {
#   description = "S3 bucket for scripts"
#   type        = string
# }

# variable "temp_dir" {
#   description = "Diretório temporário no S3"
#   type        = string
# }
# variable "table" {
#   description = "Nome da tabela no Oracle"
#   type        = string
# }

# variable "schema" {
#   description = "Nome do schema no Oracle"
#   type        = string
# }