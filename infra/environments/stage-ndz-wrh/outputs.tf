output "vpc_id" {
  description = "The VPC created by the network module"
  value       = "" #module.network.vpc_id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  #value       = module.network.subnet_ids
  value       = []
}

output "instance_ids" {
  description = "List of EC2 instance IDs"
  # value       = module.compute.instance_ids
  value       = []
}