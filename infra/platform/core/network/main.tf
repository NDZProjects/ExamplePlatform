module "vpc" {
  source    = "../../modules/vpc"
  region    = var.region
  cidr_block = var.vpc_cidr
  name = var.vpc_name

}

module "subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  env_name          = ""
  type              = ""
}


module "security_group" {
  source  = "../../modules/security-group"
  vpc_id  = module.vpc.vpc_id

  # if your SG module needs name/rules, wire them here:
  name    = var.security_group_name
  ingress = var.security_group_ingress
  egress  = var.security_group_egress
}
module "subnets" {
  source            = "../../modules/subnet"
  for_each          = var.subnets
  vpc_id            = module.vpc.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  type = each.value.type
  # Subnet naming: `${environment}-${type}-subnet-n`
  #name = "${var.env_name}-${each.value.type}-subnet-${terraform.index(var.subnets, each.key) + 1}"

  #name = "${var.env_name}-${each.value.type}-subnet-${terraform.index(var.subnets, each.key) + 1}"
  #name = "${var.env_name}-${each.value.type}-subnet-${terraform.index(var.subnets, each.key) + 1}"
  #name = "${var.env_name}-${each.value.type}-subnet-${terraform.index(var.subnets, each.key) + 1}"
  name = ""
  env_name = ""
}

