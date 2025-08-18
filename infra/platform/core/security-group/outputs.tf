output "security_group_ids" {
  description = "IDs of created security groups"
  value       = { for k, v in module.security_groups : k => v.security_group_id }
}