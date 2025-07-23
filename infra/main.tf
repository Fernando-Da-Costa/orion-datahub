module "iam" {
  source        = "../infra/modules/iam"
  iam_user_name = "devs-orion-datahub"
  environment   = "dev"
  region        = var.region
  account_id    = var.account_id
}

module "s3_lakehouse" {
  source     = "../infra/modules/s3_lakehouse"
  environment = var.environment
}

module "glue_catalog" {
  source        = "../infra/modules/glue_catalog"
  environment   = var.environment
  iam_role_arn  = module.iam.arn
}

module "athena" {
  source                = "../infra/modules/athena"
  environment           = var.environment
  athena_results_bucket = module.s3_lakehouse.athena_query_results_bucket
}

module "lakeformation" {
  source        = "../infra/modules/lakeformation"
  admin_arn     = "arn:aws:iam::475057824718:user/devs-orion-datahub"
  analyst_arn   = "arn:aws:iam::475057824718:user/devs-orion-analyst"
}

