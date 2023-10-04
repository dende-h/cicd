variable "subnet_group_name" {
  description = "subnet group name"
  type        = string
  default     = "terraform-subnet-group"
}

variable "subnet_ids" {
  description = "Subnet ID array from network module"
  type        = list(string)
}

variable "rds_allocated_storage" {
  description = "The amount of storage (in gibibytes) to allocate for the RDS instance."
  type        = number
  default     = 20
}

variable "rads_storage_type" {
  description = "The type of storage to use for the RDS instance. E.g., 'gp2', 'io1', 'standard'."
  type        = string
  default     = "gp2"
}

variable "rds_engine" {
  description = "The name of the database engine to use for the RDS instance. E.g., 'mysql', 'postgres', 'oracle'."
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "The version of the database engine to use for the RDS instance."
  type        = string
  default     = "8.0.33"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance. Determines compute and memory capacity."
  type        = string
  default     = "db.t3.micro"
}

variable "rds_name" {
  description = "The name of the RDS instance. This is used as an identifier."
  type        = string
  default     = "terraformRds"
}

variable "rds_username" {
  description = "The master username for the RDS instance."
  type        = string
  default     = "root"
}

variable "rds_password" {
  description = "The password associated with the master username for the RDS instance. Ensure this is kept secure."
  type        = string
}

variable "rds_parameter_group_name" {
  description = "The name of the parameter group to associate with the RDS instance."
  type        = string
  default     = "default.mysql8.0"
}


variable "rds_port" {
  description = "RDS Port"
  type        = number
  default     = 3306
}

variable "rds_vpc_security_group_ids" {
  description = ""
  type        = list(string)
}