 #!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Please provide environment name. \n\nExample: \n./apply.sh prod\n"
    exit 1
fi

echo "Validating Terraform Script"
terraform validate

env_arg="$1"
echo "Applying Terraform State changes to $env_arg Environment"
terraform apply -auto-approve -var-file="./config/$env_arg/primary-us-east-2/configuration.tfvars"