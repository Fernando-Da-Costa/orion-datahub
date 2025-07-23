module "groups" {
  source = "./groups"
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




module "glue_role" {
  source = "./roles/glue"
  environment = var.environment
}
module "users" {
  source = "./users"
  data_readers_group_name = module.groups.data_readers_name
}

module "attachments" {
  source = "./attachments"
  s3_read_policy_arn      = module.policies_s3.s3_read_arn
  glue_access_policy_arn  = module.policies_glue.glue_access_arn
  data_readers_group_name = module.groups.data_readers_name
  glue_role_name          = module.glue_role.glue_role_name
  athena_access_policy_arn = module.policies_athena.athena_access_arn

}