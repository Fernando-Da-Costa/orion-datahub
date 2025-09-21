output "firehose_names" {
  value = {
    for k, v in aws_kinesis_firehose_delivery_stream.firehose : k => v.name
  }
}
