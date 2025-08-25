output "vpc_id" {
  value = aws_vpc.this.id
}
# IDs of all Public Subnets
output "public_subnet_ids" {
  description = "List of IDs of Public Subnets"
  value       = aws_subnet.public.*.id
}

# IDs of all Private Subnets
output "private_subnet_ids" {
  description = "List of IDs of Private Subnets"
  value       = aws_subnet.private.*.id
}

# CIDR Blocks of Public Subnets
output "public_subnet_cidrs" {
  description = "List of CIDR Blocks of Public Subnets"
  value       = var.public_subnet_cidrs
}

# CIDR Blocks of Private Subnets
output "private_subnet_cidrs" {
  description = "List of CIDR Blocks of Private Subnets"
  value       = var.private_subnet_cidrs
}
