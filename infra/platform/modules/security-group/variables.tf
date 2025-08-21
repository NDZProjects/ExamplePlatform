
variable "vpc_id" {
  type = string
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