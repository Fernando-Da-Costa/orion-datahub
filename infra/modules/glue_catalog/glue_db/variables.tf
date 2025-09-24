variable name_database {
  type        = string
  description = "name the database"
}

variable project {
  type        = string
  default     = "orion-datahub"
  description = "project name"
}
variable layer {  
  type        = string
  default     = "medallion"
  description = "layer name"
}
variable owner {
  type        = string
  default     = "data-platform"
  description = "owner name"
}
variable environment {  
  type        = string
  default     = "dev"
  description = "environment name"
}
