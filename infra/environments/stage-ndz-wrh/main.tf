module "network" {
  source      = "../../platform/core/network"
  vpc_name    = var.vpc_name
  cidr_block  = var.network_cidr
  tags        = var.common_tags
  availability_zones = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "compute" {
  source        = "../../platform/modules/compute"
  environment   = var.environment
  ami_id        = var.ami_id              # from compute.tfvars
  instance_type = var.instance_type       # from compute.tfvars
  subnet_ids    = var.private_subnet_cidrs  # from network.tf
  tags          = var.common_tags         # reuse same tag map
  #private_subnet_ids = []
}