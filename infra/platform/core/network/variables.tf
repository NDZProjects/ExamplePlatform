variable "region" {
  type        = string
  description = "AWS region to deploy into"
}
variable "env_name" {
  type        = string
  description = "target environment name"
}
variable "vpc_name" {
  type        = string
  description = "the target name of the vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the Subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone for the Subnet"
}

variable "security_group_name" {
  type        = string
  description = "Security Group name"
  default     = "network-sg"
}

variable "security_group_ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of ingress rules for the SG"
  default     = []
}

variable "security_group_egress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of egress rules for the SG"
  default     = []
}

variable "subnets" {
  description = "Definition of subnets for the environment"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    type              = string # "public" or "private"
  }))
}
