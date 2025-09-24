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



module "s3_lakehouse" {
  source        = "../infra/modules/s3_lakehouse"
  environment   = var.environment
 
}



############################################################################################################################################
resource "aws_kinesis_firehose_delivery_stream" "firehose" {
  for_each   = var.firehose_streams
  name       = "${each.key}-firehose"
  destination = "extended_s3"

  kinesis_source_configuration {
    kinesis_stream_arn = each.value.kinesis_stream_arn
    role_arn           = module.iam.firehose_role_arn
  }

  extended_s3_configuration {
    role_arn           = module.iam.firehose_role_arn
    bucket_arn         = each.value.bucket_arn
    prefix             = each.value.prefix
    compression_format = "UNCOMPRESSED"

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = "/aws/kinesisfirehose/${each.key}-firehose"
      log_stream_name = "s3-delivery"
    }

    error_output_prefix = "${each.value.prefix}/errors/!{firehose:error-output-type}/"
  }
}
############################################################################################################################################



module "glue_catalog" {
  source        = "../infra/modules/glue_catalog"
  environment   = var.environment
  iam_role_arn  = module.iam.glue_role_arn 
  glue_role_arn    = module.iam.glue_role_arn
  name_database    = var.name_database
}


module "athena" {
  source                = "../infra/modules/athena"
  environment           = var.environment
  athena_results_bucket = module.s3_lakehouse.athena_query_results_bucket
}

# module "lakeformation" {
#   source        = "../infra/modules/lakeformation"
#   admin_arn     = "arn:aws:iam::475057824718:user/devs-orion-datahub"
#   analyst_arn   = "arn:aws:iam::475057824718:user/devs-orion-analyst"
# }

