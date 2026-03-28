resource "aws_s3_bucket" "buried_marks" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "buried_marks" {
  bucket = aws_s3_bucket.buried_marks.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "buried_marks" {
  bucket = aws_s3_bucket.buried_marks.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "${aws_s3_bucket.buried_marks.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_cors_configuration" "buried_marks" {
  bucket = aws_s3_bucket.buried_marks.id

  cors_rule {
    allowed_headers = ["Content-Type", "Authorization"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE"]
    allowed_origins = ["http://localhost"]
    expose_headers  = []
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket_name
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
