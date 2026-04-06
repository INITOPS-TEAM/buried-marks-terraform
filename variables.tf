variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "bucket_name" {
  type = string
}

variable "terraform_state_bucket_name" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "github_org" {
  type = string
}
