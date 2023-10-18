variable "role_name" {
  description = "role for ec2"
  type        = string
  default     = "terraform-ec2-IamRole"
}

variable "policy_arns" {
  description = "Policies to be assigned to roles"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}

variable "profile_name" {
  description = "ec2 profile name"
  type        = string
  default     = "terraform-ec2-instance-profile"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ec2 ami"
  type        = string
  default     = "ami-07d6bd9a28134d3b3"
}

variable "ec2_subnet1" {
  description = "From the output of the network module"
  type        = string
}

variable "sec_group_for_ec2" {
  description = "From the output of the security group"
  type        = list(string)
}

variable "keypair_name" {
  description = "The EC2 Key Pair to allow SSH access to the instance"
  type        = string
}

variable "volume_type" {
  description = "Volume type for block device mapping"
  type        = string
  default     = "gp2"
}

variable "volume_size" {
  description = "Volume size for block device mapping"
  type        = number
  default     = 8
}

variable "ec2_name" {
  description = "Name for the EC2"
  type        = string
  default     = "terraform-ec2"
}