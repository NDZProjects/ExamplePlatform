variable "route_tables" {
  description = "Map of route tables to create"
  type = map(object({
    name = string
    routes = list(object({
      cidr_block     = string
      gateway_id     = optional(string)
      nat_gateway_id = optional(string)
    }))
    subnet_ids = list(string)
  }))
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}