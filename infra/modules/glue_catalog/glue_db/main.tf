resource "aws_glue_catalog_database" "orion" {
  name = "orion"

  parameters = {
    "project"  = "orion-datahub"
    "layer"    = "medallion"
    "owner"    = "data-platform"
  }
}


