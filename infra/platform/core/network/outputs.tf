output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  description = "List of IDs for Public Subnets"
#  value       = #aws_subnet.public[*].id
  value = module.vpc.public_subnets
}
