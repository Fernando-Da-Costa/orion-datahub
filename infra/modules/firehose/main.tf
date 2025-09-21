
resource "aws_kinesis_firehose_delivery_stream" "firehose" {
  for_each   = var.firehose_streams
  name       = "${each.key}-firehose"
  destination = "extended_s3"
  source_stream_arn = "arn:aws:kinesis:sa-east-1:572422066503:stream/${each.key}-stream"
  role_arn    = module.iam.firehose_role_arn
  extended_s3_configuration {
    bucket_arn         = each.value.bucket_arn
    prefix             = each.value.prefix
    compression_format = "UNCOMPRESSED"
    buffer_size        = 5 # MB
    buffer_interval    = 300 # seconds

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = "/aws/kinesisfirehose/${each.key}-firehose"
      log_stream_name = "s3-delivery"
    }
  }
}
