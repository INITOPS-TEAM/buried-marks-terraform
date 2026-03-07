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

 2. Initialize Terraform:

```bash
terraform init
```

 3. Apply configuration:

```bash
terraform apply
```

 4. Get map-service credentials
```bash
terraform output map_service_access_key
terraform output map_service_secret_key
```

## Variables
Variables are defined in `variables.tf`.
