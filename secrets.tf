resource "aws_secretsmanager_secret" "map_service" {
  name = "buried-marks/map-service"
}

resource "aws_secretsmanager_secret" "auth_service" {
  name = "buried-marks/auth-service"
}

resource "aws_secretsmanager_secret" "voting_service" {
  name = "buried-marks/voting-service"
}

resource "aws_secretsmanager_secret_version" "map_service" {
  secret_id = aws_secretsmanager_secret.map_service.id
  secret_string = jsonencode({
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.map_service.id
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.map_service.secret
    MARIADB_PASSWORD      = var.mariadb_password
    SECRET_KEY            = var.secret_key
    JWT_PRIVATE_KEY       = file(var.jwt_private_key_path)
    JWT_PUBLIC_KEY        = file(var.jwt_public_key_path)
  })
}

resource "aws_secretsmanager_secret_version" "auth_service" {
  secret_id = aws_secretsmanager_secret.auth_service.id
  secret_string = jsonencode({
    DB_PASSWORD       = var.db_password
    DJANGO_SECRET_KEY = var.django_secret_key
  })
}

resource "aws_secretsmanager_secret_version" "voting_service" {
  secret_id = aws_secretsmanager_secret.voting_service.id
  secret_string = jsonencode({
    VOTING_DB_USER      = var.voting_db_user
    VOTING_DB_PASSWORD  = var.voting_db_password
    VOTING_DB_NAME      = var.voting_db_name
    DATABASE_URL        = var.database_url
    VOTING_DATABASE_URL = var.voting_database_url
    PGADMIN_EMAIL       = var.pgadmin_email
    PGADMIN_PASSWORD    = var.pgadmin_password
    PUBLIC_KEY_PATH     = var.public_key_path
    DJANGO_SECRET_KEY   = var.django_secret_key
    AUTH_SERVICE_URL    = var.auth_service_url

  })
}
