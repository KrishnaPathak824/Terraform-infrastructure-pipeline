terraform {
  backend "s3" {
    bucket = "krishna-tf-s3bucket"
    key    = "s3/terraform.tfstate"
    region = "us-east-1"
  }
}
