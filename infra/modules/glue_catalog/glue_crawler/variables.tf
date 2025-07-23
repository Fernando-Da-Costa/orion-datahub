variable "catalog_database_name" {
  type        = string
  description = "Nome do banco de dados do Glue Catalog"
}

variable "iam_role_arn" {
  type        = string
  description = "ARN da role IAM que o crawler usará"
}

variable "targets" {
  type = map(string)
  description = "Mapa camada => path do bucket"
}

variable "environment" {
  type        = string
  description = "Ambiente (ex: dev, prod)"
}
