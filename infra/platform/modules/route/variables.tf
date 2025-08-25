variable "route_table_id" {
  description = "The ID of the route table."
  type        = string
}

variable "destination_cidr_block" {
  description = "The destination CIDR block for the route."
  type        = string
}

variable "gateway_id" {
  description = "The ID of the Internet Gateway to route traffic through (optional)."
  type        = string
  default     = null
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway to route traffic through (optional)."
  type        = string
  default     = null
}