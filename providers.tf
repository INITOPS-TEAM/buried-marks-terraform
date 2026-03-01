terraform {
  required_version = "~> 1.14.0"

  backend "s3" {
    bucket = "buried-marks-terraform-state"
    key = "terrafrom.tfstate"
    region = "eu-north-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
