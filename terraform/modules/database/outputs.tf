output "rds_endpoint" {
  value       = aws_db_instance.terraform_rds.endpoint
  description = "The endpoint for the RDS instance"
}

output "rds_password" {
  value       = aws_db_instance.terraform_rds.password
  description = "The password for the RDS instance"
  sensitive   = true
}
