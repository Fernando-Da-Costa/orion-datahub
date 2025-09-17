

variable "role_arn" {
  type = string
}

variable "prefix" {
  type        = string
  default     = ""
  description = "Prefixo no S3 (ex: statements/)"
}

variable "firehose_streams" {
  type = map(object({
    prefix     = string
    bucket_arn = string
  }))
}
