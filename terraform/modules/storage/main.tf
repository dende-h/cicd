# Create S3
resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"

  tags = {
    Name = var.s3_bucket_name
  }
}

# Create Bucket Policy
resource "aws_s3_bucket_policy" "terraform_bucket_policy" {
  bucket = aws_s3_bucket.terraform_s3_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::584338796296:role/s3fullaccess"
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.terraform_s3_bucket.bucket}/*"
      }
    ]
  })
}

