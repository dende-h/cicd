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
  default     = "terraform-public-RouteTable"
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
  default     = "terraform-public-subnet1"
}

variable "public_subnet2_name" {
  description = "Name tag for the Public subnet2"
  type        = string
  default     = "terraform-public-subnet2"
}

variable "praivate_subnet_route_table_name1" {
  description = "Name tag for the praivate subnet route table"
  type        = string
  default     = "terraform-praiavte-RouteTable1"
}

variable "praivate_subnet_route_table_name2" {
  description = "Name tag for the praivate subnet route table"
  type        = string
  default     = "terraform-praiavte-RouteTable2"
}

variable "private_subnet1_cidr_block" {
  description = "Cider block for praivate subnet1"
  type        = string
  default     = "10.0.0.128/28"
}

variable "private_subnet2_cidr_block" {
  description = "Cider block for praivate subnet2"
  type        = string
  default     = "10.0.0.144/28"
}

variable "praivate_subnet1_name" {
  description = "Name tag for the private subnet1"
  type        = string
  default     = "terraform-praivate-subnet1"
}

variable "praivate_subnet2_name" {
  description = "Name tag for the private subnet2"
  type        = string
  default     = "terraform-praivate-subnet2"
}

variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "ap-northeast-1"
}

variable "vpc_endpoint_name" {
  description = ""
  type        = string
  default     = "terraform_vpc_endpoint"
}