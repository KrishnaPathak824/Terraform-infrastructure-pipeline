terraform {
  backend "s3" {
    bucket = "com.krishna-tf-s3bucket"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}

