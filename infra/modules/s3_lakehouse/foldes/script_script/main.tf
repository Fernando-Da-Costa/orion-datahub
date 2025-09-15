resource "aws_s3_object" "scripts_folder" {
  bucket = var.bucket_script
  key    = "scripts/"
  content = "" 
}
