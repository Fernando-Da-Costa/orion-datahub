resource "aws_s3_object" "firehose_folders" {
  for_each = toset(["matches", "payments", "statements"])

  bucket  = "orion-datahub-${each.key}-${var.environment}"
  key     = "${each.key}/" 
  content = ""
}


resource "aws_s3_object" "folders" {
  for_each = toset([
    "matches/",
    "payments/",
    "statements/"
  ])

  bucket  = "orion-datahub-${split("/", each.key)[0]}-${var.environment}"
  key     = each.key
  content = ""
}
