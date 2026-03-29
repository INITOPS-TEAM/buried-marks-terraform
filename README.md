# BuriedMarks Terraform

AWS infrastructure configuration for BuriedMarks project.

## Resources

- S3 bucket for media storage `buried-marks-media`.
- S3 bucket for Terraform state `buried-marks-terraform-state`.
- IAM users for map-service and github-service with S3 permissions.
- ECR repositories for Docker and Helm images.

## Prerequisites

- Terraform installed.
- AWS credentials with required permissions.

## Multi Environment Setup

1. Export AWS credentials:

```bash
export AWS_ACCESS_KEY_ID="your_key"
export AWS_SECRET_ACCESS_KEY="your_secret"
```

 1. Creating a bucket

Comment out the backend block "s3" in the main.tf file.

```bash
 # backend "s3" {
  #   bucket       = "your-bucket-name"
  #   key          = "state-path"
  #   region       = "your-region"
  #   encrypt      = true
  #   use_lockfile = true
  # }
```

 1. Local initialization:

The command will create a bucket in AWS and a local state file on your computer.

```bash
terraform init
```

```bash
terraform apply
```

 1. State migration

Uncomment the backend "s3" block

```bash
backend "s3" {
  bucket       = "your-bucket-nam"
  key          = "state-path"
  region       = "your-region"
  encrypt      = true
  use_lockfile = true
}
```

Execute the command:

```bash
terraform init
```

Confirm copying the state

## Justfile

Justfile is provided for easy setup. Installation of [Just](https://just.systems/man/en/packages.html) is required.

You also need to export `ENV`:

```bash
export ENV=dev # or stage, or prod
```

Use following commands to operate with terraform:

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

## Get map-service credentials

```bash
terraform output -raw map_service_access_key
terraform output -raw map_service_secret_key
```

## Variables

Variables are defined in `variables.tf`.
