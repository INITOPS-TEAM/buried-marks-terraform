resource "aws_iam_user" "map_service" {
    name = "buried-marks-map-service"
}

resource "aws_iam_user_policy" "map_service_s3" {
    name = "BuriedMarksS3Policy"
    user = aws_iam_user.map_service.name

    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"],
            "Resource": "${aws_s3_bucket.buried_marks.arn}/*"
        }
    ]
    })
}

resource "aws_iam_access_key" "map_service" {
    user = aws_iam_user.map_service.name
}

output "map_service_access_key" {
    value = aws_iam_access_key.map_service.id
    sensitive = true
}

output "map_service_access_key" {
    value = aws_iam_access_key.map_service.secret
    sensitive = true
}
