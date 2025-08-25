variable "region" {
  type = string
}
variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
#variable "storage_subnet_cidr" {
#  type = string
#}
variable "availability_zone" {
  type = string
}

variable "env_name" {
  description = "the technical name of the environment"
  type        = string
}



variable "availability_zones" {
  description = "List of availability zones for the selected AWS region"
  type        = list(string)
}
variable "global_tags" {
  default = {
    Environment = "stage"
  }
}

