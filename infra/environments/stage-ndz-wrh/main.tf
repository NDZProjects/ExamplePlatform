terraform {
  required_version = ">= 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  backend "s3" {
    bucket         = var.backend_bucket          # e.g. "my-terraform-states"
    key            = "${var.environment}/terraform.tfstate"
    region         = var.aws_region              # e.g. "eu-west-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  env = var.environment
}

module "network" {
  source      = "../../platform/modules/network"
  environment = local.env
  cidr_block  = var.network_cidr          # defined in network.tfvars
  azs         = var.availability_zones    # defined in common.tfvars
  tags        = var.common_tags           # defined in common.tfvars
}

module "compute" {
  source        = "../../platform/modules/compute"
  environment   = local.env
  ami_id        = var.ami_id              # from compute.tfvars
  instance_type = var.instance_type       # from compute.tfvars
  subnet_ids    = module.network.subnet_ids
  tags          = var.common_tags         # reuse same tag map
}

output "vpc_id" {
  description = "The VPC created by the network module"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = module.network.subnet_ids
}

output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = module.compute.instance_ids
}