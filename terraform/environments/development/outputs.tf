output "output_alb_endpoint" {
  description = "The endpoint of the Application Load Balancer from root"
  value       = module.load_balancer.alb_endpoint
}

output "output_ec2_public_ip" {
  description = "Output EC2 public IP address"
  value       = module.compute.ec2_public_ip
}

output "rds_endpoint" {
  description = "The endpoint for the RDS instance"
  value       = module.database.rds_endpoint
}

output "rds_password" {
  description = "The password for the RDS instance"
  value       = module.database.rds_password
  sensitive   = true
}
