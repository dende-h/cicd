output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_s3_bucket.name
  description = "The AmazonS3 bucket name"
}
