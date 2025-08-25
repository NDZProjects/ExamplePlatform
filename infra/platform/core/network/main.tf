
module "vpc" {
  source    = "../../modules/vpc"
  region    = var.region
  cidr_block = var.vpc_cidr
  name = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  map_public_ip_on_launch = var.map_public_ip_on_launch
  instance_tenancy     = var.instance_tenancy
  global_tags          = var.global_tags
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  internet_gateway_name = "${var.env_name}-igw"
  global_tags = {}
  depends_on = [module.vpc]
}
module "public_route_table" {
  source              = "../../modules/route-table"
  name                = "public-route-table"
  vpc_id              = module.vpc.vpc_id
  #internet_gateway_id = ""
  #module.internet_gateway.internet_gateway_id
  tags = {
    Environment = var.env_name
    Project     = "platform"
  }
  depends_on = [ module.internet_gateway]
}

module "private_route_table" {
  source              = "../../modules/route-table"
  name                = "private-route-table"
  vpc_id              = module.vpc.vpc_id
  tags = {
    Environment = var.env_name
    Project     = "platform"
  }
  depends_on = [ module.nat_gateway]
}

module "public_subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  env_name          = var.env_name
  type              = "public"
  depends_on = [module.vpc]
}
module "private_subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  env_name          = var.env_name
  type              = "private"
  depends_on = [module.vpc]
}

module "nat_gateway" {
  source            = "../../modules/nat-gateway"
  env_name          = var.env_name
  environment       = var.env_name
  public_subnet_ids = [ module.public_subnet.subnet_id ]
  depends_on = [ module.public_subnet  ]
tags = {
  Name = "${var.env_name}-nat-gateway"
}
}
module "security_groups" {
  source = "../../modules/security-groups"

  # Pass necessary inputs depending on your security-groups module's design
  vpc_id = module.vpc.vpc_id
  environment = var.env_name
}
module "public_route" {
  source = "../../modules/route"

  route_table_id          = module.public_route_table.route_table_id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = module.internet_gateway.internet_gateway_id
}

module "private_route" {
  source = "../../modules/route/"
  route_table_id          = module.private_route_table.route_table_id
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id          = module.nat_gateway.nat_gateway_ids[0]
}




