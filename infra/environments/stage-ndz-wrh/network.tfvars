# Network configuration
vpc_name             = "${var.environment}-idlms-vpc"
vpc_cidr             = "10.122.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true

# Internet Gateway
internet_gateway_name = "${var.environment}-idlms-igw"

# NAT Gateway configuration
total_nat_gateway_required = 3
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
  cidrs_blocks         = ["10.121.15.0/26", "10.121.15.64/26", "10.121.15.128/26"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "${var.environment}-lb"
  route_table_name     = "${var.environment}-lb"
  routes               = []
}

private_app_subnets = {
  cidrs_blocks         = ["10.121.16.0/22", "10.121.20.0/22", "10.121.24.0/22"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "${var.environment}-app"
  route_table_name     = "${var.environment}-app"
  routes               = []
}

private_data_subnets = {
  cidrs_blocks         = ["10.121.40.0/24", "10.121.41.0/24", "10.121.42.0/24"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "${var.environment}-data"
  route_table_name     = "${var.environment}-data"
  routes               = []
  is_public            = true
}

private_services_subnets = {
  cidrs_blocks         = ["10.121.254.0/26", "10.121.254.64/26", "10.121.254.128/26"]
  availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  subnets_name_prefix  = "${var.environment}-service"
  route_table_name     = "${var.environment}-service"
  routes               = []
}