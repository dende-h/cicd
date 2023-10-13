terraform {
  backend "s3" {
    bucket         = "my-s3-bucket-terraform-state"
    key            = "development/terraform.tfstate"
    region         = "ap-northeast-1"  
    encrypt        = true 
}
}