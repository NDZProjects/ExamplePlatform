output "role_arns" {
  description = "ARNs of created IAM roles"
  value       = { for k, v in module.iam_roles : k => v.role_arn }
}

output "instance_profile_names" {
  description = "Names of created instance profiles"
  value       = { for k, v in module.iam_roles : k => v.instance_profile_name }
}