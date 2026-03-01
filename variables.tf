variable "aws_region" {
  type = string
  default = "eu-north-1"
}

variable "aws_access_key" {
  type = string
  sensitive = true
}
variable "aws_secret_key" {
  type = string
  sensitive = true
}

variable "bucket_name" {
  type = string
  default = "buried-marks-media"
}
