resource "aws_ecr_repository" "map_service" {
    name = "buried-marks/map-service"
}

resource "aws_ecr_repository" "auth_service" {
    name = "buried-marks/auth-service"
}

resource "aws_ecr_repository" "map_front" {
    name = "buried-marks/map-front"
}

resource "aws_ecr_repository" "login_front" {
    name = "buried-marks/login-front"
}
