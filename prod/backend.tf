terraform {
  backend "s3" {
    bucket  = "iq-demo-bucket"
    key     = "prod/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}