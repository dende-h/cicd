provider "aws" {
  region = "ap-northeast-1" 
}

module "network" {
  source = "../../modules/network" // モジュールのパスを指定

  // 必要に応じて変数をオーバーライド
  vpc_cidr_block = "10.0.0.0/24"
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.network.vpc_id
}

module "load_balancer" {
  source = "../../modules/load_balancer"
  vpc_id = module.network.vpc_id
  public_subnet1_id = module.network.public_subnet1_id
  public_subnet2_id = module.network.public_subnet2_id
  alb_sec_group_id  = module.security.alb_sec_group_id
  port = module.security.alb_ingress_port
}

module "compute" {
  source = "../../modules/compute"
  ec2_subnet1 = module.network.public_subnet1_id
  sec_group_for_ec2 = module.security.ec2_sec_group_id
  keypair_name = "RaisetechEC2KeyPair"
}