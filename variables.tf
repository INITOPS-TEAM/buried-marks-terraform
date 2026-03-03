variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}
variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "bucket_name" {
  type    = string
  default = "buried-marks-media"
}

variable "mariadb_password" {
  type      = string
  sensitive = true
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "jwt_private_key_path" {
  type    = string
  default = "./ec_private.key"
}

variable "jwt_public_key_path" {
  type    = string
  default = "./ec_public.key"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "django_secret_key" {
  type      = string
  sensitive = true
}

variable "voting_db_user" {
  type      = string
  default = "admin"
}

variable "voting_db_name" {
  type      = string
  default = "voting_db"
}

variable "voting_db_password" {
  type      = string
  sensitive = true
}

variable "database_url" {
  type      = string
  sensitive = true
}

variable "voting_database_url" {
  type      = string
  sensitive = true
}

variable "pgadmin_email" {
  type      = string
  sensitive = true
}

variable "pgadmin_password" {
  type      = string
  sensitive = true
}

variable "public_key_path" {
  type      = string
  default = "public.pem"
}

variable "auth_service_url" {
  type      = string
  sensitive = true
}

