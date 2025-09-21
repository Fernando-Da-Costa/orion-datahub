variable "name" {}
variable "bucket_arn" {}
variable "prefix" {}
variable "stream_arn" {}
variable "role_arn" {}

variable "firehose_streams" {
  type = map(object({
    stream_arn  = string
    bucket_arn  = string
    prefix      = string
  }))
}

