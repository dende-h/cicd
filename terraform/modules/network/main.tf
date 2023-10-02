resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.igw_name
  }
}

# resource "aws_route_table" "my_public_subnet_route_table" {
#   vpc_id = aws_vpc.my_vpc.id
#   tags = {
#     Name = var.public_subnet_route_table_name
#   }
# }



# resource "aws_subnet" "my_public_subnet1" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = var.public_subnet1_cidr_block
#   map_public_ip_on_launch = true
#   availability_zone = element(flatten([for az in data.aws_availability_zones.available.names : list(az)]), 0)
#   tags = {
#     Name = var.public_subnet1_name
#   }
# }

# resource "aws_subnet" "my_public_subnet2" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = var.public_subnet2_cidr_block
#   map_public_ip_on_launch = true
#   availability_zone = element(flatten([for az in data.aws_availability_zones.available.names : list(az)]), 1)
#   tags = {
#     Name = var.public_subnet2_name
#   }
# }

# resource "aws_route_table_association" "my_associate_route_table_for_public_subnet1" {
#   subnet_id = aws_subnet.my_public_subnet1.id
#   route_table_id = aws_route_table.my_public_subnet_route_table.id
# }

# resource "aws_route_table_association" "my_associate_route_table_for_public_subnet2" {
#   subnet_id      = aws_subnet.my_public_subnet2.id
#   route_table_id = aws_route_table.my_public_subnet_route_table.id
# }

# resource "aws_route" "my_public_subnet_route" {
#   route_table_id = aws_route_table.my_public_subnet_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = aws_internet_gateway.my_igw.id
# }


