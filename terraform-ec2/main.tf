data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_iam_role" "ec2" {
  name = "ec2-iam-krishna-role-1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "krishna_ec2_instance_profile-role-1"
  role = aws_iam_role.ec2.name
}

resource "aws_instance" "krishna-tf-ec2instance" {
  ami                  = data.aws_ami.amazon_linux.id
  instance_type        = "t2.micro"
  key_name             = "krishna-ec2"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name    = "EC2Instance"
    Creator = "Krishna"
  }
}

