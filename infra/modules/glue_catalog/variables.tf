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
variable "bucket_names" {
  type = map(string)
}