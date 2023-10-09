variable "alb_name" {
  description = "Name for the ALB"
  type        = string
  default     = "terraform-alb"
}

variable "alb_target" {
  description = "Name for the target-group"
  type        = string
  default     = "terraform-alb-target"
}

//他のモジュールで定義したvpc_idを受け取るための変数定義
variable "vpc_id" {
  description = "vpc id"
  type        = string
}

//他のモジュールで定義したSubnet_idを受け取るための変数定義
variable "public_subnet1_id" {
  description = "public subnet id"
  type        = string
}

variable "public_subnet2_id" {
  description = "public subnet id"
  type        = string
}

variable "alb_sec_group_id" {
  description = "alb security group id"
  type        = string
}

variable "port" {
  description = "listener and target-group port"
  type        = number
  default     = 80
}

variable "target_ec2" {
  description = "ec2 id"
  type        = string
}