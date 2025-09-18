resource "aws_s3_object" "firehose_folders" {
  for_each = toset(["matches", "payments", "statements"])

  bucket  = "orion-datahub-${each.key}-${var.environment}"
  key     = "${each.key}/"  # Isso cria a "pasta"
  content = ""
}


resource "aws_s3_object" "folders" {
  for_each = toset([
    "matches/raw/",
    "matches/processed/",
    "payments/raw/",
    "payments/processed/",
    "statements/raw/",
    "statements/processed/"
  ])

  bucket  = "orion-datahub-${split("/", each.key)[0]}-${var.environment}"
  key     = each.key
  content = ""
}
