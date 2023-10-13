output "alb_endpoint" {
  description = "The endpoint of the Application Load Balancer"
  value       = aws_lb.terraform_alb.dns_name
}