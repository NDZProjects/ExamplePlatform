

variable "env_name" {
  description = "The environment name (e.g., dev, stage, prod)."
  type        = string
}
variable "environment" {
  description = "The environment name (e.g., dev, stage, prod)."
  type        = string
}
variable "global_tags" {
  description = "A map of global tags applied to all resources."
  type        = map(string)
  default     = {}
}
variable "nat_count" {
  description = "The number of NAT Gateways to create (should match the number of public subnets)."
  type        = number
  default     = 1
}
variable "connectivity_type" {
  description = "Connectivity type for NAT Gateways (e.g., public or private). Defaults to public."
  type        = string
  default     = "public"
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs for the NAT Gateway"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_ids) > 0
    error_message = "The public_subnet_ids variable must not be empty. Please provide at least one Public Subnet ID."
  }
}
