module "iam" {
  source        = "../infra/modules/iam"
  iam_user_name = "devs-orion-datahub"
  environment   = "dev"
  region        = var.region
  account_id    = var.account_id
}

module "s3_lakehouse" {
  source        = "../infra/modules/s3_lakehouse"
  environment   = var.environment
  bucket_script = "orion-datahub-script"

}

module "glue_catalog" {
  source        = "../infra/modules/glue_catalog"
  environment   = var.environment
  iam_role_arn  = module.iam.arn
  script_path      = "s3://orion-datahub-script/scripts/oracle_to_parquet_partitioned.py"
  s3_input_path    = "s3://orion-datahub-bronze/fonte_a/"
  s3_output_path   = "s3://orion-datahub-silver/"
  temp_dir         = "s3://orion-datahub-bronze/temp/"
  glue_role_arn    = module.iam.arn
  bucket_script    = module.s3_lakehouse.bucket_script
  # bucket_bronze = module.s3_lakehouse.bucket_bronze
}


# module "athena" {
#   source                = "../infra/modules/athena"
#   environment           = var.environment
#   athena_results_bucket = module.s3_lakehouse.athena_query_results_bucket
# }

# module "lakeformation" {
#   source        = "../infra/modules/lakeformation"
#   admin_arn     = "arn:aws:iam::475057824718:user/devs-orion-datahub"
#   analyst_arn   = "arn:aws:iam::475057824718:user/devs-orion-analyst"
# }

