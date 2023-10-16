variable "rds_password" {
  description = "The password associated with the master username for the RDS instance. Ensure this is kept secure."
  type        = string
  default     = ""
}
