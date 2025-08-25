variable "environment" {
  description = "The target environment name"
  type        = string
}
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-vpc"
}
variable "region" {
  description = "AWS region for resources"
  type        = string
  default = "eu-west-1"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default = "eu-west-1"
}
variable "enable_dns_support" {
  description = "enable dns support"
  type = bool
  default = true
}



variable "backend_bucket" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default = "var_environment_bucket"
}

variable "availability_zones" {
  description = "List of AZs to use for networking"
  type        = list(string)
  default = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "network_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
  default =  "ami_id_000001"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default = "t2.micro"
}

variable "enable_versioning" {
  description = "Whether to enable versioning on S3 buckets"
  type        = bool
  # no default → this must be provided by tfvars
}

variable "total_nat_gateway_required" {
  description = "Whether to enable versioning on S3 buckets"
  type        = bool
  # no default → this must be provided by tfvars
}

variable private_app_subnets  {
  #cidrs_blocks         = ["10.121.16.0/22", "10.121.20.0/22", "10.121.24.0/22"]
  #availability_zones   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#subnets_name_prefix  = "${var.environment}-app"
#route_table_name     = "${var.environment}-app"
  #routes               = []
}
variable tf_state_region {
  description = "tf_state_region desc"
  type        = string
  default = "eu-west-1"
}
variable "vpc_cidr" {
  description = "vpc_cidr desc"
  type = string
  default = "10.0.0.0/16"
}
variable "app_ports" {
  description = "app_ports_1"
  type = list(string)
  default = ["4000"]
}
variable "private_data_subnets" {
  description = "private subnet structure"
  type = object({
    cidrs_blocks        = list(string)
    availability_zones  = list(string)
    subnets_name_prefix = string
    route_table_name    = string
    routes              = list(object({
      # Example fields—replace or remove as needed:
      destination_cidr_block = string
      gateway_id             = string
    }))
  })
  default = {
    cidrs_blocks        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    subnets_name_prefix = "private"
    route_table_name    = "private"
    routes              = []  # must match list(object({...})) above
  }
}

variable "tf_state_bucket" {
  description = "name of s3 bucket for terraform state"
  default = "terraform_state"
}

variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type = bool
  default = true
}
variable "public_subnet_cidrs" {
  description = " public subnet cidrs"
  type = list(string)
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}
variable "private_subnet_cidrs" {
  description = " private subnet cidrs"
  type = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
variable "public_data_subnets" {
  description = "private subnet structure"
  type = object({
    cidrs_blocks        = list(string)
    availability_zones  = list(string)
    subnets_name_prefix = string
    route_table_name    = string
    routes              = list(object({
      # Example fields—replace or remove as needed:
      destination_cidr_block = string
      gateway_id             = string
    }))
  })
  default = {
    cidrs_blocks        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    subnets_name_prefix = "public"
    route_table_name    = "public"
    routes              = []  # must match list(object({...})) above
  }
}
variable "public_app_subnets" {
  description = "private subnet structure"
  type = object({
    cidrs_blocks        = list(string)
    availability_zones  = list(string)
    subnets_name_prefix = string
    route_table_name    = string
    routes              = list(object({
      # Example fields—replace or remove as needed:
      destination_cidr_block = string
      gateway_id             = string
    }))
  })
  default = {
    cidrs_blocks        = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
    availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    subnets_name_prefix = "public-app"
    route_table_name    = "public-app"
    routes              = []  # must match list(object({...})) above
  }
}
variable "private_lb_subnets" {
  description = "Configuration for private subnets to host an internal load balancer"
  type = object({
    cidr_blocks        = list(string)        # subnet CIDR blocks
    availability_zones = list(string)        # matching AZs for each subnet
    subnets_name_prefix = string             # prefix for subnet names
    route_table_name   = string              # name of the route table to associate
    tags               = map(string)         # optional tags to apply to each subnet
  })
  default = {
    cidr_blocks         = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
    availability_zones  = ["eu-west-1a",   "eu-west-1b",   "eu-west-1c"]
    subnets_name_prefix = "private-lb"
    route_table_name    = "rtb-private-lb"
    tags = {
      Environment = "prod"
      Project     = "my-app"
    }
  }
}