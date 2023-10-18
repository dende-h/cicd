data "aws_availability_zones" "available" {
  state = "available"
}

# Subnet group creation
resource "aws_db_subnet_group" "terraform_rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  description = "subnet group for rds"

  tags = {
    Name = var.subnet_group_name
  }
}

# Create RDS
resource "aws_db_instance" "terraform_rds" {
  allocated_storage           = var.rds_allocated_storage
  storage_type                = var.rds_storage_type
  engine                      = var.rds_engine
  engine_version              = var.rds_engine_version
  instance_class              = var.rds_instance_class
  db_name                     = var.rds_name
  username                    = var.rds_username
  password                    = var.rds_password
  parameter_group_name        = var.rds_parameter_group_name
  skip_final_snapshot         = true
  availability_zone           = element(data.aws_availability_zones.available.names, 0)
  backup_retention_period     = 0
  storage_encrypted           = true
  auto_minor_version_upgrade  = true
  allow_major_version_upgrade = false
  copy_tags_to_snapshot       = false
  delete_automated_backups    = true
  db_subnet_group_name        = aws_db_subnet_group.terraform_rds_subnet_group.name
  vpc_security_group_ids      = var.rds_vpc_security_group_ids
  port                        = var.rds_port
  multi_az                    = false
  publicly_accessible         = false

  tags = {
    Name = var.rds_name
  }
}

