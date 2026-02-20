terraform {
  backend "s3" {
    bucket  = "iq-demo-bucket"
    key     = "dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}