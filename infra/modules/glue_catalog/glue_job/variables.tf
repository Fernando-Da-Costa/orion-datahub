variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
}

variable "glue_role_arn" {
  description = "ARN da role usada pelo Glue"
  type        = string
}

variable "script_path" {
  description = "Caminho do script Python no S3"
  type        = string
}

variable "s3_input_path" {
  description = "Caminho de entrada no S3"
  type        = string
}

variable "s3_output_path" {
  description = "Caminho de saída no S3"
  type        = string
}

variable "temp_dir" {
  description = "Diretório temporário no S3"
  type        = string
}


variable "job_name" {
  description = "Nome do job Glue"
  type        = string
  default     = "oracle-to-parquet-partitioned"
}
variable "table" {
  description = "Nome da tabela no Oracle"
  type        = string
}

variable "schema" {
  description = "Nome do schema no Oracle"
  type        = string
}
