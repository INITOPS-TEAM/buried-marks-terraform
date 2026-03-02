resource "aws_s3_bucket" "buried_marks" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "buried-marks-terraform-state"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
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
