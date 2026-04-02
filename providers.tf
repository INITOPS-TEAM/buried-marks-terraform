terraform {
  required_version = "~> 1.14.0"

  backend "s3" {
    bucket       = ""
    key          = ""
    region       = ""
    use_lockfile = true
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

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
