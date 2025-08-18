# Common environment configuration
environment = "stage-ndz-wrh"
region      = "eu-west-1"

# Common tags applied to all resources
common_tags = {
  Environment = "stage-ndz-wrh"
  Project     = "idlms"
  Owner       = "idlms-api"
}

# Common Terraform state configuration
tf_state_bucket = "stage-ndz-wrh-btl-idlms-backend-api-tfstate-014125597127"
tf_state_region = "eu-west-1"