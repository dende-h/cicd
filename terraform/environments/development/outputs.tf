output "output_alb_endpoint" {
  description = "The endpoint of the Application Load Balancer from root"
  value       = module.load_balancer.alb_endpoint
}

output "output_ec2_public_ip" {
  description = ""
  value       = module.compute.ec2_public_ip
}