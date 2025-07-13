output "ec2_instance_arn" {
  value = aws_instance.krishna-tf-ec2instance.arn
}

output "ec2_role_arn" {
  value = aws_iam_role.ec2.arn
}
