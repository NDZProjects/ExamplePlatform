# SSM specific configuration
ssm_param_name         = "/idlms/shared/${var.environment}/.env"
ssm_param_description  = "Shared environment variables for IDLMS in ${var.environment}"
ssm_param_app_tag      = "idlms"
app_env_content        = ""
