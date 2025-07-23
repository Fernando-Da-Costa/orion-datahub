variable "admin_arn" {
  description = "ARN do principal (geralmente IAM Role ou User Admin) que será o administrador do Lake Formation"
  type        = string
}

variable "analyst_arn" {
  description = "ARN do principal (ex: usuário IAM de analista) com permissão básica DESCRIBE no catálogo"
  type        = string
}
