output "alb_sec_group_id" {
  value = aws_security_group.terraform_sec_gp_for_alb.id
}

output "alb_ingress_port" {
  value = var.alb_ingress_port
}

output "ec2_sec_group_id" {
  value = aws_security_group.terraform_sec_gp_for_ec2.id
}

output "rds_sec_group_id" {
  value = aws_security_group.terraform_sec_gp_for_rds.id
}