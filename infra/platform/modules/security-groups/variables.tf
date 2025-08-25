
variable "vpc_id" {
  type = string
}
variable "environment" {
  description = "The environment name (e.g., dev, stage, prod)"
  type        = string
}
variable "global_tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  type    = string
  default = "default-sg"
}
variable "description" {
  type    = string
  default = "default security group"
}

variable "ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of ingress rules"
  default     = []
}

variable "egress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of egress rules"
  default     = []
}
variable "security_groups" {
  description = "A list of security group definitions"
  type = list(object({
    name          = string
    description   = string
    ingress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
  default = []
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs for the NAT Gateway"
  type        = list(string)
  default     = [] # Default empty list (safe fallback)
}
