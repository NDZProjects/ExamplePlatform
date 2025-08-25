variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway to."
  type        = string
}

variable "internet_gateway_name" {
  description = "The name of the Internet Gateway resource."
  type        = string
}
variable "global_tags" {
  description = "Global tags applied to all resources."
  type = map(string)
}
