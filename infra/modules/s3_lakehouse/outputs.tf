output "athena_query_results_bucket" {
  value = aws_s3_bucket.lake_layer["athena-query-results"].id
}
