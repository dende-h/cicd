terraform {
  backend "s3" {
    bucket         = "my-s3-bucket-terraform-state"  #下記を作成した自身でS3の名前に書き換えてください
    key            = "development/terraform.tfstate"
    region         = "ap-northeast-1"  
    encrypt        = true 
}
}