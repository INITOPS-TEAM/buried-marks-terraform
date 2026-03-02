locals {
  ecr_repositories = [
    "login-front",
    "map-front",
    "map-service",
    "auth-service",
    "voting-service",
    "mail-service"
  ]
}

resource "aws_ecr_repository" "services" {
  for_each = toset(local.ecr_repositories)
  name     = "buried-marks/${each.key}"
}

resource "aws_ecr_lifecycle_policy" "services" {
  for_each   = toset(local.ecr_repositories)
  repository = aws_ecr_repository.services[each.key].name
  depends_on = [aws_ecr_repository.services]

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 5 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 5
      }
      action = { type = "expire" }
    }]
  })
}
