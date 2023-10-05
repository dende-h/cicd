output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_eip.terraform-eip.public_ip
}