terraform {
  backend "s3" {
    bucket = "orion-datahub"
    key    = "lakehouse/terraform.tfstate"
    region = "sa-east-1"
  }
}
