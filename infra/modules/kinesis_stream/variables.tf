variable "stream_name" {
  type        = string
  description = "Nome do Kinesis Stream"
}

variable "shard_count" {
  type        = number
  default     = 1
  description = "Número de shards (ignorado se ON_DEMAND)"
}

variable "retention_hours" {
  type        = number
  default     = 24
  description = "Tempo de retenção em horas"
}

variable "environment" {
  type        = string
  default     = "dev"
}

variable "owner" {
  type        = string
  default     = "fernando"
}
