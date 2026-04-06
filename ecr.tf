locals {
  ecr_repositories = [
    "admin-front",
    "authentication-microservice",
    "login-front",
    "mail-microservice",
    "map-front",
    "map-microservice",
    "voting-front",
    "voting-microservice",
    # ECR repositories for Helm charts
    "helm-admin-front",
    "helm-authentication-microservice",
    "helm-gateway",
    "helm-login-front",
    "helm-mail-microservice",
    "helm-map-front",
    "helm-map-microservice",
    "helm-monitoring",
    "helm-voting-front",
    "helm-voting-microservice",
  ]
}

resource "aws_ecr_repository" "services" {
  for_each = toset(local.ecr_repositories)
  name     = "buried-marks-${each.key}"
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
