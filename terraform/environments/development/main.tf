provider "aws" {
  # リージョンを自身の利用しているものに設定してください
  region = "ap-northeast-1"
}

module "network" {
  source = "../../modules/network" #　モジュールのパスを指定
# 必要に応じて変数をオーバーライドしてください
  # vpc_cidr_block = "10.0.0.0/24"
  # vpc_name = "terraform-VPC"
  # igw_name = "terraform-IGW"
  # public_subnet_route_table_name = "terraform-public-RouteTable"
  # public_subnet1_cidr_block = "10.0.0.0/28"
  # public_subnet2_cidr_block = "10.0.0.16/28"
  # public_subnet1_name = "terraform-public-subnet1"
  # public_subnet2_name = "terraform-public-subnet2"
  # praivate_subnet_route_table_name1 = "terraform-praiavte-RouteTable1"
  # praivate_subnet_route_table_name2 = "terraform-praiavte-RouteTable2"
  # private_subnet1_cidr_block =  "10.0.0.128/28"
  # private_subnet2_cidr_block = "10.0.0.144/28"
  # praivate_subnet1_name = "terraform-praivate-subnet1"
  # praivate_subnet2_name = "terraform-praivate-subnet2"
  # aws_region = "ap-northeast-1"
  # vpc_endpoint_name = "terraform_vpc_endpoint"
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.network.vpc_id

# EC2のSSH接続を許可するIPアドレスを絞る場合は下記を変更してください。
  my_ip = ["0.0.0.0/0"] #指定したIPアドレス以外からの通信をブロックするように設定。自身のローカルPCのIPを指定するとセキュアです。

# 必要に応じて変数をオーバーライドしてください
  # alb_sec_group_name = "alb-sec-terraform"
  # alb_sec_group_description = "security for alb access"
  # ec2_sec_group_name = "ec2-sec-terraform"
  # ec2_sec_group_description = "security for ec2 access"
  # rds_sec_group_name = "rds-sec-terraform"
  # rds_sec_group_description = "security for rds access"
  # alb_ingress_port = 80
  # ec2_ingress_port = 22
  # rds_ingress_port = 3306
  # protocol = "tcp"
}

module "load_balancer" {
  source            = "../../modules/load_balancer"
  vpc_id            = module.network.vpc_id
  public_subnet1_id = module.network.public_subnet1_id
  public_subnet2_id = module.network.public_subnet2_id
  alb_sec_group_id  = module.security.alb_sec_group_id
  port              = module.security.alb_ingress_port
  target_ec2        = module.compute.ec2_instance_id

# 必要に応じて変数をオーバーライドしてください
  # alb_name = "terraform-alb"
  # alb_target = "terraform-alb-target"
}

module "compute" {
  source            = "../../modules/compute"
  ec2_subnet1       = module.network.public_subnet1_id
  sec_group_for_ec2 = [module.security.ec2_sec_group_id] 
#事前に作成したキーペア名を指定してください。キーペアが存在しない場合失敗します。
  keypair_name = <<"your-key-pair-name">>

# 必要に応じて変数をオーバーライドしてください
# 下記はdefault値です。
  # role_name = "terraform-ec2-IamRole"
  # policy_arns =  ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
  # profile_name = "terraform-ec2-instance-profile"
  # instance_type = "t2.micro"
  # ami = "ami-07d6bd9a28134d3b3"
  
  # volume_type = "gp2"
  # volume_size = 8
  # ec2_name = "terraform-ec2"
}

module "database" {
  source                     = "../../modules/database"
  subnet_ids                 = module.network.praivate_subnet_ids
  rds_vpc_security_group_ids = [module.security.rds_sec_group_id]
  rds_password = var.rds_password #環境変数から取得している
# 必要に応じて変数をオーバーライドしてください。
# 下記はdefault値です。
  # subnet_group_name = "terraform-subnet-group"
  # rds_allocated_storage = 20
  # rads_storage_type = "gp2"
  # rds_engine = "mysql"
  # rds_engine_version = "8.0.33"
  # rds_instance_class = "db.t3.micro"
  # rds_name = "terraformRds"
  # rds_username = "root"
  # rds_parameter_group_name = "default.mysql8.0"
  # rds_port = 3306
}

module "storage" {
  source = "../../modules/storage"
# s3バケット名は自分で作成したいS3の名前に上書きしてください。既に存在する名前の場合失敗します。
# 手順4で作成したバケット名ではありません。使用しないでください。
  s3_bucket_name = <<"yuur-s3bucket-name">>
}