resource "aws_kinesis_stream" "this" {
  name             = var.stream_name
  retention_period = var.retention_hours

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }

  tags = {
    Environment = var.environment
    Owner       = var.owner
  }
}
