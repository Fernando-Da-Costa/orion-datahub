resource "aws_kinesis_firehose_delivery_stream" "firehose" {
  for_each   = var.firehose_streams
  name       = "${each.key}-firehose"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn           = var.role_arn
    bucket_arn         = each.value.bucket_arn
    prefix             = each.value.prefix
    compression_format = "UNCOMPRESSED"

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = "/aws/kinesisfirehose/${each.key}-firehose"
      log_stream_name = "s3-delivery"
    }
  }
}