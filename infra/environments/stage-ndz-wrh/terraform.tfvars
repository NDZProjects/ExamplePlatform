# Main environment configuration file
# This file combines all configuration files for the stage-ndz-wrh environment

# Load common environment settings
# terraform apply -var-file="common.tfvars" -var-file="network.tfvars" -var-file="compute.tfvars" -var-file="cloudwatch.tfvars" -var-file="ecr.tfvars" -var-file="api.tfvars" -var-file="s3.tfvars" -var-file="ssm.tfvars"

# Or use this single file approach by including all necessary variables:
environment = "stage-ndz-wrh"
region      = "eu-west-1"