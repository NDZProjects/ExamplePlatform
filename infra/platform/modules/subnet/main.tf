resource "aws_subnet" "this" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = var.name
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