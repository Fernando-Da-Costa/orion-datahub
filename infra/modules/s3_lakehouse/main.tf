resource "aws_s3_bucket" "firehose_layer" {
  for_each = toset(["matches", "payments", "statements"])

  bucket = "orion-datahub-${each.key}-${var.environment}"

  tags = {
    Name        = "orion-datahub-${each.key}-${var.environment}"
    Environment = var.environment
    Layer       = each.key
    Project     = "orion-datahub"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "firehose_layer_encryption" {
  for_each = aws_s3_bucket.firehose_layer
  bucket = each.value.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "firehose_layer_versioning" {
  for_each = aws_s3_bucket.firehose_layer
  bucket = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

######################################################################################################
#
######################################################################################################

module "s3_folder" {
  source        = "./foldes/script_script"
  for_each      = toset(["matches", "payments", "statements"])
  bucket_script = "orion-datahub-${each.key}-${var.environment}"
  environment   = var.environment
}



# module "s3_file" {
#   source        = "./file"
#   bucket_script = var.bucket_script
# }