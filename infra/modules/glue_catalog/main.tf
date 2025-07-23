module "glue_db" {
  source = "./glue_db"
}

module "glue_crawler" {
  source                = "./glue_crawler"
  catalog_database_name = module.glue_db.catalog_database_name
  iam_role_arn          = var.iam_role_arn
  environment           = var.environment 

  targets = {
    bronze = "s3://orion-datahub-bronze"
    silver = "s3://orion-datahub-silver"
    gold   = "s3://orion-datahub-gold"
  }
}