resource "aws_glue_crawler" "this" {
  for_each = var.targets

  name          = "orion-${each.key}"
  role          = var.iam_role_arn
  database_name = var.catalog_database_name
  s3_target {
    path = each.value
  }
  configuration = jsonencode({
    Version = 1.0
    CrawlerOutput = {
      Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
    }
  })
  schedule = "cron(0 * * * ? *)" 
  tags = {
    Environment = var.environment
    Layer       = each.key
    Owner       = "orion-datahub"
  }
}
