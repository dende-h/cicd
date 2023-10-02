variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "terraform-MyVPC"
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
  default     = "terraform-MyIGW"
}

# variable "public_subnet_route_table_name" {
#   description = "Name tag for the Public subnet route table"
#   type        = string
#   default     = "terraform-MyRouteTable"
# }
