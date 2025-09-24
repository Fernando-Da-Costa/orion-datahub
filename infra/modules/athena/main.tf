resource "aws_athena_workgroup" "orion" {
  name = var.workgroup_name
  configuration {
    enforce_workgroup_configuration = true
    result_configuration {
      output_location = "s3://${var.athena_results_bucket}/"
    }
  }

  tags = {
    Environment = var.environment
    Owner       = var.owner
  }
}
