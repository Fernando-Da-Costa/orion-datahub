################################################################
# Criando todas as politicas necessarias para o projeto.
################################################################
module "policies_kinesis" {
  source              = "./policies/kinesis"
  environment         = var.environment
}

module "policies_s3" {
  source = "./policies/s3"
}
module "policies_glue" {
  source        = "./policies/glue"
  environment   = var.environment
}
module "policies_athena" {
  source        = "./policies/athena"
  environment   = var.environment
}
module "policies_lakeformation" {
  source        = "./policies/lakeformation"
  environment   = var.environment

}






module "glue_role" {
  source = "./roles/glue"
  environment = var.environment
}

module "lambda_role" {
  source      = "./roles/lambda"
  environment = var.environment
}




module "users" {
  source = "./users"
  data_readers_group_name = module.groups.data_readers_name
}




################################################################
# Criando todos os attachments necessarios para o projeto.
################################################################
module "attachments" {
  source                        = "./attachments"
  s3_read_policy_arn            = module.policies_s3.s3_read_arn
  glue_access_policy_arn        = module.policies_glue.glue_access_arn
  data_readers_group_name       = module.groups.data_readers_name
  glue_role_name                = module.glue_role.glue_role_name
  lambda_role_name              = module.lambda_role.lambda_role_name
  athena_access_policy_arn      = module.policies_athena.athena_access_arn
  kinesis_access_policy_arn      = module.policies_kinesis.kinesis_access_arn
  lakeformation_access_policy_arn = module.policies_lakeformation.lakeformation_access_arn
  lambda_access_policy_arn        = module.policies_kinesis.kinesis_access_arn
}



module "groups" {
  source = "./groups"
}