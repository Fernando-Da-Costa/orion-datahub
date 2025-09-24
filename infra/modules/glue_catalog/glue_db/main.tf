resource "aws_glue_catalog_database" "this" {
  name = var.name_database

  parameters = {
    "project"  = var.project
    "layer"    = var.layer
    "owner"    = var.owner
    "env"      = var.environment
  }
}


