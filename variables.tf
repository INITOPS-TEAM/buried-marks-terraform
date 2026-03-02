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
