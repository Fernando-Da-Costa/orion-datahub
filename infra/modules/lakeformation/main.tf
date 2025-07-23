resource "aws_lakeformation_data_lake_settings" "default" {
  catalog_id = data.aws_caller_identity.current.account_id
  admins     = [var.admin_arn]
}

resource "aws_lakeformation_permissions" "glue_catalog_access" {
  principal                     = var.analyst_arn
  permissions                   = ["DESCRIBE"]
  catalog_id                    = data.aws_caller_identity.current.account_id
  catalog_resource              = true
  permissions_with_grant_option = []
}


data "aws_caller_identity" "current" {}
