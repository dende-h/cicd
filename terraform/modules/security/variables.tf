variable "my_ip" {
    description = "my local PC ip"
    type        = list(string)
    default     = ["122.131.47.188/32","106.73.101.33/32"]
}

variable "alb_sec_group_name" {
  description = "Name for the ALB security group"
  type        = string
  default     = "alb-sec-terraform"
}

variable "alb_sec_group_description" {
  description = "Description for the ALB security group"
  type        = string
  default     = "security for alb access"
}

variable "ec2_sec_group_name" {
  description = "Name for the EC2 security group"
  type        = string
  default     = "ec2-sec-terraform"
}

variable "ec2_sec_group_description" {
  description = "Description for the ec2 security group"
  type        = string
  default     = "security for ec2 access"
}

variable "rds_sec_group_name" {
  description = "Name for the RDS security group"
  type        = string
  default     = "rds-sec-terraform"
}

variable "rds_sec_group_description" {
  description = "Description for the RDS security group"
  type        = string
  default     = "security for rds access"
}

variable "alb_ingress_port" {
  description = "Ingress port for ALB security group"
  type        = number
  default     = 80
}

variable "ec2_ingress_port" {
  description = "Ingress port for EC2 security group"
  type        = number
  default     = 22
}

variable "rds_ingress_port" {
  description = "Ingress port for RDS security group"
  type        = number
  default     = 3306
}

variable "protocol" {
  description = "Protocol for the security group rules"
  type        = string
  default     = "tcp"
}

//他のモジュールで定義したvpc_idを受け取るための変数定義
variable "vpc_id" {
  description = "vpc id"
  type        = string
}