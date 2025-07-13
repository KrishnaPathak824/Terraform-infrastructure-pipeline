data "terraform_remote_state" "ec2" {
  backend = "local"
  config = {
    path = "../terraform-ec2/terraform.tfstate"
  }
}

resource "aws_s3_bucket" "krishna-tf-s3bucket" {
  bucket = "krishna-tf-s3bucket"

  tags = {
    Name    = "S3Bucket"
    Creator = "Krishna Pathak"
  }
}

resource "aws_s3_bucket_policy" "write_only_policy" {
  bucket = aws_s3_bucket.krishna-tf-s3bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "WriteOnlyAccess"
        Effect = "Allow"
        Principal = {
          AWS = data.terraform_remote_state.ec2.outputs.ec2_role_arn
        }
        Action   = ["s3:PutObject"]
        Resource = "${aws_s3_bucket.krishna-tf-s3bucket.arn}/*"
      }
    ]
  })
}
