module "iam" {
  source        = "../infra/modules/iam"
  iam_user_name = var.iam_user_name
  environment   = var.environment
  region        = var.region
  account_id    = var.account_id
}


module "kinesis_stream" {
  source              = "./modules/kinesis_stream"
  for_each            = var.kinesis_stream_name
  kinesis_stream_name = each.value
  shard_count         = 1
}


module "lambda_functions" {
  source               = "./modules/lambda"
  for_each             = local.lambda_configs
  function_name        = each.value.function_name
  handler              = "${each.value.function_name}.lambda_handler"
  runtime              = "python3.12"
  schedule_expression  = "rate(5 minutes)"
  iam_role_arn         = module.iam.lambda_role_arn
  include_pandas_layer = true
  region               = var.region
  lambda_config        = each.value
}





# module "s3_lakehouse" {
#   source        = "../infra/modules/s3_lakehouse"
#   environment   = var.environment
#   bucket_script = "orion-datahub-script"

# }

# module "glue_catalog" {
#   source        = "../infra/modules/glue_catalog"
#   environment   = var.environment
#   iam_role_arn  = module.iam.arn
#   script_path      = "s3://orion-datahub-script/scripts/oracle_to_parquet_partitioned.py"
#   s3_input_path    = "s3://orion-datahub-bronze/fonte_a/"
#   s3_output_path   = "s3://orion-datahub-silver/"
#   temp_dir         = "s3://orion-datahub-bronze/temp/"
#   glue_role_arn    = module.iam.arn
#   bucket_script    = module.s3_lakehouse.bucket_script
#   table            = "empregados"
#   schema           = "orion"    
# }


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

