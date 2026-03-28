aws-auth:
    if [ ${ENV} == "dev" ]; then source ~/Documents/AWS_CREDS_DEV.txt; \
    elif [ ${ENV} == "stage" ]; then source ~/Documents/AWS_CREDS_STAGE.txt; \
    elif [ ${ENV} == "prod" ]; then source ~/Documents/AWS_CREDS_PROD.txt; fi

terraform-init: aws-auth
    terraform init \
        -backend-config="./environments/backends/${ENV}.config"

terraform-plan: terraform-init
    terraform plan \
        -var-file="./environments/variables/${ENV}.tfvars.json"

terraform-apply: terraform-init
    terraform apply \
        -var-file="./environments/variables/${ENV}.tfvars.json"
