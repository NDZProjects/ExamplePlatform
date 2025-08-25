env_name          = "stage"
vpc_name          = "stage-vpc"
region            = "us-east-1"
vpc_cidr          = "10.0.0.0/16"
public_subnet_cidr       = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
#storage_subnet_cidr = "10.0.3.0/24"
availability_zone = "us-east-1a"
availability_zones =  ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
subnets = local.subnets


