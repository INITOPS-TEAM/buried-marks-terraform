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
- Create `.env.<serviceName>.json` files from `.env.<serviceName>.json.example` stored in `secrets` directory.

## Multi Environment Setup

1. Export AWS credentials:

   ```bash
   export AWS_ACCESS_KEY_ID="your_key"
   export AWS_SECRET_ACCESS_KEY="your_secret"
   ```

2. Creating a bucket

   Comment out the backend block "s3" in the providers.tf file.

   ```bash
   # backend "s3" {
     #   bucket       = "your-bucket-name"
     #   key          = "state-path"
     #   region       = "your-region"
     #   encrypt      = true
     #   use_lockfile = true
     # }
   ```

3. Local initialization:

   The command will create a bucket in AWS and a local state file on your computer.

     ```bash
     just terraform-init
     ```

     ```bash
     just terraform-apply
     ```

4. State migration

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
   just terraform-init
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

## Variables

Variables are defined in `variables.tf`.
