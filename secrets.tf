resource "aws_secretsmanager_secret" "map_service" {
  name = "buried-marks/map-service"
}

resource "aws_secretsmanager_secret" "auth_service" {
  name = "buried-marks/auth-service"
}

resource "aws_secretsmanager_secret" "voting_service" {
  name = "buried-marks/voting-service"
}

resource "aws_secretsmanager_secret" "mail_service" {
  name = "buried-marks/mail-service"
}

resource "aws_secretsmanager_secret" "monitoring" {
  name = "buried-marks/monitoring"
}

resource "aws_secretsmanager_secret" "consul" {
  name = "buried-marks/consul"
}

resource "aws_secretsmanager_secret_version" "map_service" {
  secret_id     = aws_secretsmanager_secret.map_service.id
  secret_string = file("secrets/.env.map.json")
}

resource "aws_secretsmanager_secret_version" "auth_service" {
  secret_id     = aws_secretsmanager_secret.auth_service.id
  secret_string = file("secrets/.env.auth.json")
}

resource "aws_secretsmanager_secret_version" "voting_service" {
  secret_id     = aws_secretsmanager_secret.voting_service.id
  secret_string = file("secrets/.env.voting.json")
}

resource "aws_secretsmanager_secret_version" "mail_service" {
  secret_id     = aws_secretsmanager_secret.mail_service.id
  secret_string = file("secrets/.env.mail.json")
}

resource "aws_secretsmanager_secret_version" "monitoring" {
  secret_id     = aws_secretsmanager_secret.monitoring.id
  secret_string = file("secrets/.env.monitoring.json")
}

resource "aws_secretsmanager_secret_version" "consul" {
  secret_id     = aws_secretsmanager_secret.consul.id
  secret_string = file("secrets/.env.consul.json")
}
