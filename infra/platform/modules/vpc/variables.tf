variable "region" {
  type        = string
  description = "AWS region to deploy the VPC into"
}
variable "name" {
  type    = string
  default = "default-vpc"
}
variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

# List of CIDR blocks for public subnets
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

# List of CIDR blocks for private subnets
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

# Enable DNS Support in the VPC
variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}

# Enable DNS Hostnames in the VPC
variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

# Map Public IP Addresses on Instances Launched in Public Subnets
variable "map_public_ip_on_launch" {
  description = "Whether to map a public IP address to instances launched in public subnets"
  type        = bool
  default     = true
}

# Instance Tenancy Setting for the VPC
variable "instance_tenancy" {
  description = "The instance tenancy option for the VPC. Can be 'default' or 'dedicated'"
  type        = string
  default     = "default"
}

# Global Tags for Resources
variable "global_tags" {
  description = "Map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}
