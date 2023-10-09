resource "aws_security_group" "terraform_sec_gp_for_alb" {
  name        = var.alb_sec_group_name
  description = var.alb_sec_group_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.alb_ingress_port
    to_port     = var.alb_ingress_port
    protocol    = "tcp"
    cidr_blocks = var.my_ip
  }

  tags = {
    Name = var.alb_sec_group_name
  }
}

resource "aws_security_group" "terraform_sec_gp_for_ec2" {
  name        = var.ec2_sec_group_name
  description = var.ec2_sec_group_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ec2_ingress_port
    to_port     = var.ec2_ingress_port
    protocol    = "tcp"
    cidr_blocks = var.my_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_sec_group_name
  }
}

resource "aws_security_group_rule" "security_group_ingress_for_ec2" {
  type                     = "ingress"
  from_port                = var.alb_ingress_port
  to_port                  = var.alb_ingress_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.terraform_sec_gp_for_ec2.id
  source_security_group_id = aws_security_group.terraform_sec_gp_for_alb.id
}

resource "aws_security_group_rule" "security_group_egress_for_alb" {
  type                     = "egress"
  from_port                = var.alb_ingress_port
  to_port                  = var.alb_ingress_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.terraform_sec_gp_for_alb.id
  source_security_group_id = aws_security_group.terraform_sec_gp_for_ec2.id
}

resource "aws_security_group" "terraform_sec_gp_for_rds" {
  name        = var.rds_sec_group_name
  description = var.rds_sec_group_description
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.rds_ingress_port
    to_port         = var.rds_ingress_port
    protocol        = "tcp"
    security_groups = [aws_security_group.terraform_sec_gp_for_ec2.id]
  }

  tags = {
    Name = var.rds_sec_group_name
  }
}

resource "aws_security_group_rule" "security_group_egress_for_rds" {
  type                     = "egress"
  from_port                = var.rds_ingress_port
  to_port                  = var.rds_ingress_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.terraform_sec_gp_for_rds.id
  source_security_group_id = aws_security_group.terraform_sec_gp_for_ec2.id
}
