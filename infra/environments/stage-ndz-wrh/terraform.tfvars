# Main environment configuration file
# This file combines all configuration files for the stage-ndz-wrh environment

# Load common environment settings
# terraform apply -var-file="common.tfvars" -var-file="network.tfvars" -var-file="compute.tfvars" -var-file="cloudwatch.tfvars" -var-file="ecr.tfvars" -var-file="api.tfvars" -var-file="s3.tfvars" -var-file="ssm.tfvars"

# Or use this single file approach by including all necessary variables:
environment = "stage-ndz-wrh"
region      = "eu-west-1"
vpc_name = "stage-vpc"


# Common environment configuration
#environment = "stage-ndz-wrh"
#region      = "eu-west-1"

# Common tags applied to all resources
common_tags = {
  Environment = "stage-ndz-wrh"
  Project     = "idlms"
  Owner       = "idlms-api"
}

# Common Terraform state configuration
tf_state_bucket = "stage-ndz-wrh-btl-idlms-backend-api-tfstate-014125597127"
tf_state_region = "eu-west-1"

enable_versioning = true

# Network configuration
vpc_name             = "${var.environment}-idlms-vpc"
vpc_cidr             = "10.122.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true

# Internet Gateway
internet_gateway_name = "${var.environment}-idlms-igw"

# NAT Gateway configuration
total_nat_gateway_required = true
eip_for_nat_gateway_name   = "${var.environment}-idlms-eip"
nat_gateway_name           = "${var.environment}-idlms-ngw"

# Subnet configurations
public_subnets = {
  cidrs_blocks         = ["10.122.1.0/24", "10.122.2.0/24"]
  availability_zones   = ["eu-west-1a", "eu-west-1b"]
  subnets_name_prefix  = "${var.environment}-public"
  route_table_name     = "${var.environment}-public"
  map_public_ip_on_launch = true
  routes               = []
}

private_subnets = {
  cidrs_blocks         = ["10.122.10.0/24", "10.122.20.0/24"]
  availability_zones   = ["eu-west-1a", "eu-west-1b"]
  subnets_name_prefix  = "${var.environment}-private"
  route_table_name     = "${var.environment}-private"
  routes               = []
}

private_lb_subnets = {
  cidr_blocks         = ["10.121.15.0/26", "10.121.15.64/26", "10.121.15.128/26"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "var.environment-lb"
  route_table_name     = "var.environment-lb"
  routes               = []
  tags = {
    Environment = "prod"
    Project     = "my-app"
  }
}

private_app_subnets = {
  cidrs_blocks         = ["10.121.16.0/22", "10.121.20.0/22", "10.121.24.0/22"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "var.environment-app"
  route_table_name     = "var.environment-app"
  routes               = []
}

private_data_subnets = {
  cidrs_blocks         = ["10.121.40.0/24", "10.121.41.0/24", "10.121.42.0/24"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "var.environment-data-subnet"
  route_table_name     = "var.environment-data-routable"
  routes               = []
  is_public            = true
}

private_services_subnets = {
  cidrs_blocks         = ["10.121.254.0/26", "10.121.254.64/26", "10.121.254.128/26"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "${var.environment}-service-subnet"
  route_table_name     = "${var.environment}-service-routable"
  routes               = []
}

providers = { aws = aws }

# EC2 and compute configuration
ami_id               = "ami-01f23391a59163da9"
instance_type        = "t2.micro"
app_ports           = [4000, 4001, 4002]

# IAM configuration
#ec2_ssm_profile_name = "${var.environment}-ec2_ssm_profile"
#ec2_ssm_role_name    = "ec2_ssm_role-${var.environment}"

# Storage configuration
#docker_artifact_bucket = "idlms-${var.environment}-built-artifact-014125597127"

# EC2 tags

#ec2_tags = {
#Name = "Backend API IDLMS-${var.environment}"
#}