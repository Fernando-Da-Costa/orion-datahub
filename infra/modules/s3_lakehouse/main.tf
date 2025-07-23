resource "aws_s3_bucket" "lake_layer" {
  for_each = toset(["bronze", "silver", "gold", "athena-query-results"])

  bucket = "orion-datahub-${each.key}"

  tags = {
    Name        = "orion-datahub-${each.key}-${var.environment}"
    Environment = var.environment
    Layer       = each.key
    Project     = "orion-datahub"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lake_layer_encryption" {
  for_each = aws_s3_bucket.lake_layer

  bucket = each.value.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "lake_layer_versioning" {
  for_each = aws_s3_bucket.lake_layer

  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}
