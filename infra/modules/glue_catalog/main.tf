module "glue_db" {
  source = "./glue_db"
}

module "glue_crawler" {
  source                = "./glue_crawler"
  catalog_database_name = module.glue_db.catalog_database_name
  iam_role_arn          = var.iam_role_arn
  environment           = var.environment 

  targets = {
    bronze  = "s3://orion-datahub-bronze"
    silver  = "s3://orion-datahub-silver"
    gold    = "s3://orion-datahub-gold"
  }
}

module "glue" {
  source           = "./glue_job"
  environment      = var.environment
  glue_role_arn    = var.iam_role_arn
  script_path      = "s3://orion-datahub-script/scripts/oracle_to_parquet_partitioned.py"
  s3_input_path    = "s3://orion-datahub-bronze/fonte_a/"
  s3_output_path   = "s3://orion-datahub-silver/"
  temp_dir         = "s3://orion-datahub-bronze/temp/"
  table            = "empregados"
  schema           = "orion"  
}