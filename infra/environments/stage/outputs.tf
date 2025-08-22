output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "security_group_id" {
  value = module.network.security_group_id
}
output "env_name" {
  value = var.env_name
}

output "vpc_name" {
  value = var.vpc_name
}