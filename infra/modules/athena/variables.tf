variable "environment" {
  description = "Ambiente do projeto"
  type        = string
}

variable "athena_results_bucket" {
  description = "Bucket onde resultados do Athena serão armazenados"
  type        = string
}
variable "workgroup_name" {
  description = "Nome da workgroup do Athena"
  type        = string
}

variable "owner" {
  description = "owner do workgroup do Athena"
  type        = string
}