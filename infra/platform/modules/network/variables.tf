#variable "environment" {
#  description = "Name of the environment (e.g. stage-ndz-wrh)"
#  type        = string
#}

variable "vpc_id" {
  description = "The target vpc id"
  type = string
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of AZs in which to create subnets"
  type        = list(string)
}

variable "subnet_mask_bits" {
  description = "Number of bits to add to the VPC mask when generating subnet CIDRs"
  type        = number
  default     = 8  # if your VPC is /16, this gives /24 subnets
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "private_subnet_ids" {
  description = "private subnet ids"
  type        = map(string)
  default     = {}
}

variable "public_subnet_ids" {
  description = "public subnet ids"
  type        = map(string)
  default     = {}
}
