variable "environment" {
  description = "Ambiente do projeto"
  type        = string
}

variable "athena_results_bucket" {
  description = "Bucket onde resultados do Athena serão armazenados"
  type        = string
}
