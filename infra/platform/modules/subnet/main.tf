resource "aws_subnet" "this" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.name
    Environment       = var.env_name
    Type              = var.type # "public" or "private"
  }
}

variable "vpc_id" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "name" {
  type    = string
  default = "default-subnet"
}
variable "env_name" {
  description = "The environment name (e.g., stage, prod)"
  type        = string
}
variable "type" {
  description = "Type of the subnet (public or private)"
  type        = string
}