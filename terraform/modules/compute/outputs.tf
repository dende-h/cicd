output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_eip.terraform-eip.public_ip
}

output "ec2_instance_id" {
  description = "ec2 instance id"
  value       = aws_instance.terraform_ec2.id
}