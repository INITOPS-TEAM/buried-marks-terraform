terraform-init:
    terraform init \
        -backend-config="./environments/backends/${ENV}.config"

terraform-plan: terraform-init
    terraform plan \
        -var-file="./environments/variables/${ENV}.tfvars.json"

terraform-apply: terraform-init
    terraform apply \
        -var-file="./environments/variables/${ENV}.tfvars.json"
