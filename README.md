# BuriedMarks Terraform

AWS infrastructure configuration for BuriedMarks project.

## Resources

- S3 bucket for media storage `buried-marks-media`.
- S3 bucket for Terraform state `buried-marks-terraform-state`.
- IAM user for map-service with S3 permissions.
- ECR repositories for Docker images.

## Prerequisites

- Terraform installed.
- AWS credentials with required permissions.

## Setup

1. Export AWS credentials:

```bash
export AWS_ACCESS_KEY_ID="your_key"
export AWS_SECRET_ACCESS_KEY="your_secret"
```

 1. Initialize Terraform:

```bash
terraform init
```

 1. Apply configuration:

```bash
terraform apply
```

 1. Get map-service credentials

```bash
terraform output -raw map_service_access_key
terraform output -raw map_service_secret_key
```

## Variables

Variables are defined in `variables.tf`.

## Justfile

Justfile is provided for easy setup. Installation of [Just](https://just.systems/man/en/packages.html) is required.
Use following commands to operate witn terraform:

- `just terraform-init`
- `just terraform-apply`
- `just terraform-plan`

### Credentials

Store AWS credentials in following files for use of provided Justfile.

```bash
~/Documents/AWS_CREDS_DEV.txt
~/Documents/AWS_CREDS_STAGE.txt
~/Documents/AWS_CREDS_PROD.txt
```

Example of `AWS_CREDS_*.txt` is represented below:

```bash
export AWS_ACCESS_KEY_ID='somevalue'
export AWS_SECRET_ACCESS_KEY='somevalue'
```
