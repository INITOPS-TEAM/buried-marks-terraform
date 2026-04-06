resource "aws_iam_user" "map_service" {
  name = "buried-marks-map-service"
}

resource "aws_iam_user_policy" "map_service_s3" {
  name = "BuriedMarksS3Policy"
  user = aws_iam_user.map_service.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : ["s3:PutObject", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket"],
        "Resource" : "${aws_s3_bucket.buried_marks.arn}/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "map_service" {
  user = aws_iam_user.map_service.name
}

resource "aws_iam_openid_connect_provider" "github_service" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]
}

resource "aws_iam_role" "github_service" {
  name = "github-service"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringLike" : {
              "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
              "token.actions.githubusercontent.com:sub" : "repo:${var.github_org}/*"
            }
          }
        }
      ]
    }
  )
}

resource "aws_iam_policy" "github_service" {
  name        = "github-service-policy"
  description = "Policy for GitHub AWS OIDC"

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:CompleteLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:InitiateLayerUpload",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:BatchGetImage"
        ],
        "Resource" : [for v in aws_ecr_repository.services : v.arn]
      },
      {
        "Action" : [
          "ecr:GetAuthorizationToken"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ],
  })
}

resource "aws_iam_policy_attachment" "github_service" {
  name       = "github-service-attachment"
  roles      = [aws_iam_role.github_service.name]
  policy_arn = aws_iam_policy.github_service.arn
}
