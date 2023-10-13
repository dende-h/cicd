output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.terraform_public_subnet1.id

}

output "public_subnet2_id" {
  value = aws_subnet.terraform_public_subnet2.id
}

output "praivate_subnet_ids" {
  value = [aws_subnet.terraform_private_subnet1.id, aws_subnet.terraform_private_subnet2.id]
}