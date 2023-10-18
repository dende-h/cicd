variable "rds_password" {
  description = "The password associated with the master username for the RDS instance. Ensure this is kept secure."
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "Name of the new S3bucket to be built"
  type        = string
  default     = ""
}

variable "keypair_name" {
  description = "Name of the key pair file for ssh connection to ec2"
  type        = string
  default     = ""
}

variable "tfstate_storage" {
  description = "Name of S3 for storage to keep tfstate"
  type        = string
  default     = ""
}