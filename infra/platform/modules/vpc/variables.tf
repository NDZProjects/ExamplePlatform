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