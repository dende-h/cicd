provider "aws" {
  region = "ap-northeast-1" 
}

module "network" {
  source = "../../modules/network" // モジュールのパスを正確に指定してください。

  // 必要に応じて変数をオーバーライド
  vpc_cidr_block = "10.0.0.0/24"
  vpc_name       = "my-VPC"
  igw_name       = "my-IGW"

}


