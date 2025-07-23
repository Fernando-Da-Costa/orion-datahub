resource "aws_athena_workgroup" "orion" {
  name = "orion-datahub-wg"
  configuration {
    enforce_workgroup_configuration = true
    result_configuration {
      output_location = "s3://${var.athena_results_bucket}/"
    }
  }

  tags = {
    Environment = var.environment
    Owner       = "orion-datahub"
  }
}
