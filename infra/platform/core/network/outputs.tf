output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  description = "List of IDs for Public Subnets"
  value = module.vpc.public_subnet_ids
}
output "private_subnet_ids" {
  description = "List of IDs for Public Subnets"
  value = module.vpc.private_subnet_ids
}
# Internet Gateway ID
output "internet_gateway_id" {
  description = "ID of the internet gateway attached to the VPC"
  value       = module.internet_gateway.internet_gateway_id
}

# Route Table ID for Public Subnets
output "public_route_table_id" {
  description = "Route table ID for the public subnets"
  value       = module.public_route_table.route_table_id
}

# NAT Gateway IDs
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs created in the public subnets"
  value       = module.nat_gateway.nat_gateway_ids
}

# Security Group IDs
output "security_group_ids" {
  description = "List of security group IDs created for the network"
  value       = module.security_groups.security_group_ids
}

# CIDR Block of the VPC
#output "vpc_cidr_block" {
#  description = "The CIDR block assigned to the VPC"
#  value       = var.cidr_block
#}

# Public Subnet CIDRs
output "public_subnet_cidrs" {
  description = "The CIDR blocks for public subnets"
  value       = var.public_subnet_cidrs
}

# Private Subnet CIDRs
output "private_subnet_cidrs" {
  description = "The CIDR blocks for private subnets"
  value       = var.private_subnet_cidrs
}
