output "athena_query_results_bucket" {
  value = aws_s3_bucket.firehose_layer["athena-query-results"].id
}


# output "bucket_script" {
#   value = aws_s3_bucket.firehose_layer["script"].id
# }

# output "bucket_bronze" {
#   value = aws_s3_bucket.firehose_layer["bronze"].id
# }

# output "bucket_silver" {
#   value = aws_s3_bucket.firehose_layer["silver"].id
# }

# output "bucket_gold" {
#   value = aws_s3_bucket.firehose_layer["gold"].id
# }