# TERRAFORM SCRIPT FOR HHS TIERS CLOUD MIGRATION

## CONFIGURATION

Current Environment Configuration is stored in "./config/prod/primary-us-east-2"
Common configuration across env. is stored in "./common_variables.auto.tfvars"


## Execution Instruction

Execute below shell script to Validate and Apply Terraform

`
$./apply.sh prod
`

Execute below shell script to Validate and Destroy Terraform

`
$./destroy.sh prod
`