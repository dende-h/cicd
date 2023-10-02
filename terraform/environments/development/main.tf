provider "aws" {
  region = "ap-northeast-1" 
}

module "network" {
  source = "../../modules/network" // モジュールのパスを指定

  // 必要に応じて変数をオーバーライド
  vpc_cidr_block = "10.0.0.0/24"
}


