output "firehose_arns" {
  value = {
    for name, stream in aws_kinesis_firehose_delivery_stream.firehose :
    name => stream.arn
  }
}
