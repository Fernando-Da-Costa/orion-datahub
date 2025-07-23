resource "aws_lakeformation_data_lake_settings" "default" {
  catalog_id = data.aws_caller_identity.current.account_id
  admins     = ["arn:aws:iam::475057824718:user/devs-orion-datahub"]
}

resource "aws_lakeformation_permissions" "glue_catalog_access" {
  principal      = var.analyst_arn
  catalog_id     = data.aws_caller_identity.current.account_id
  catalog_resource = true
  permissions = [
    "DESCRIBE",
    "CREATE_LF_TAG"  
  ]
  permissions_with_grant_option = []
}



data "aws_caller_identity" "current" {}
