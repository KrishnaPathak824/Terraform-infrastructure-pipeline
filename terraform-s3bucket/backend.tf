terraform {
  backend "s3" {
    bucket = "com.krishna-tf-s3bucket"
    key    = "s3/terraform.tfstate"
    region = "us-east-1"
  }
}
