
# EC2 IAM Role
resource "aws_iam_role" "terraform_ec2_iam_role_for_s3" {
  name               = var.role_name
  path               = "/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = var.policy_arns
}

resource "aws_iam_instance_profile" "terraform_ec2_instance_profile" {
  name = var.profile_name
  role = aws_iam_role.terraform_ec2_iam_role_for_s3.name
}

# EC2 Instance
resource "aws_instance" "terraform_ec2" {
  key_name               = var.keypair_name
  instance_type          = var.instance_type
  ami                    = var.ami
  iam_instance_profile   = aws_iam_instance_profile.terraform_ec2_instance_profile.name
  monitoring             = false
  disable_api_termination = false

  network_interface {
    device_index          = 0
    associate_public_ip_address = true
    subnet_id             = var.ec2_subnet
    security_groups       = var.sec_group_for_ec2
  }

  availability_zone =  element(data.aws_availability_zones.available.names, 0)

  root_block_device {
    device_name = var.device_name
    volume_type = var.volume_type
    volume_size = var.volume_size
  }


  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y git
              yum install -y mysql
              EOF

  tags = {
    Name = var.ec2_name
  }
}


