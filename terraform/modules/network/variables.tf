variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "terraform-VPC"
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
  default     = "terraform-IGW"
}

variable "public_subnet_route_table_name" {
  description = "Name tag for the Public subnet route table"
  type        = string
  default     = "terraform-RouteTable"
}

variable "public_subnet1_cidr_block" {
  description = "Cider Block for Subnet1"
  type        = string
  default     = "10.0.0.0/28"
}

variable "public_subnet2_cidr_block" {
  description = "Cider Block for Subnet2"
  type        = string
  default     = "10.0.0.16/28"
}

variable "public_subnet1_name" {
  description = "Name tag for the Public subnet1"
  type        = string
  default     = "terraform-Subnet1"
}

variable "public_subnet2_name" {
  description = "Name tag for the Public subnet2"
  type        = string
  default     = "terraform-Subnet2"
}