terraform {
  backend "s3" {
    key            = "development/terraform.tfstate"
    region         = "ap-northeast-1"  
    encrypt        = true 
}
}