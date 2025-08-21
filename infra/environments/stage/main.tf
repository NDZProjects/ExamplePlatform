variable "region" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "availability_zone" {
  type = string
}

provider "aws" {
  region = var.region
}

module "network" {
  source            = "../../platform/core/network"
  region            = var.region
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}