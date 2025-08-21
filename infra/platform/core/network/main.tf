module "vpc" {
  source    = "../../modules/vpc"
  region    = var.region
  cidr_block = var.vpc_cidr
}

module "subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}


module "security_group" {
  source  = "../../modules/security-group"
  vpc_id  = module.vpc.vpc_id

  # if your SG module needs name/rules, wire them here:
  name    = var.security_group_name
  ingress = var.security_group_ingress
  egress  = var.security_group_egress
}
