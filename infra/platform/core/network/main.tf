module "vpc" {
  source    = "../../modules/vpc"
  region    = var.region
  cidr_block = var.vpc_cidr
  name = var.vpc_name
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
  internet_gateway_name = "${var.env_name}-igw"
  global_tags = {}
}

module "subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  env_name          = var.env_name
  type              = ""
}

module "nat" {
  source            = "../../modules/nat"
  #vpc_id            = module.vpc.vpc_id
  #cidr_block        = var.subnet_cidr
  #availability_zone = var.availability_zone
  env_name          = var.env_name
  #type              = ""
  environment       = var.env_name
  public_subnet_ids = ["192.168.0.0"]
}




