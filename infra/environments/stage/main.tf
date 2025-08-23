
provider "aws" {
  region = var.region
}

locals{

  subnets = {
    private_1 = {
      cidr_block        = "10.0.5.0/24"
      availability_zone = var.availability_zones[0] # First zone
      type              = "private"
    }
    private_2 = {
      cidr_block        = "10.0.6.0/24"
      availability_zone = var.availability_zones[1] # Second zone
      type              = "private"
    }
    public_1 = {
      cidr_block        = "10.0.7.0/24"
      availability_zone = var.availability_zones[2] # Third zone
      type              = "public"
    }
    public_2 = {
      cidr_block        = "10.0.8.0/24"
      availability_zone = var.availability_zones[3] # Fourth zone
      type              = "public"
    }
  }
}
module "network" {
  source            = "../../platform/core/network"
  vpc_name          = var.vpc_name
  region            = var.region
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  env_name          = var.env_name
  subnets = local.subnets
}

