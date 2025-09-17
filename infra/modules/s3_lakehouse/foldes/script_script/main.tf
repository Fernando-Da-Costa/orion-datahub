resource "aws_s3_object" "firehose_folders" {
  for_each = toset(["matches", "payments", "statements"])

  bucket  = "orion-datahub-${each.key}-${var.environment}"
  key     = "${each.key}/"  # Isso cria a "pasta"
  content = ""
}
