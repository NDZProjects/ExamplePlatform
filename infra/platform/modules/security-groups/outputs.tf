
output "security_group_ids" {
  description = "The IDs of the created Security Groups"
  value       = aws_security_group.this[*].id
}

output "security_group_names" {
  description = "The names of the created Security Groups"
  value       = aws_security_group.this[*].name
}

output "security_group_arns" {
  description = "The ARNs of the created Security Groups"
  value       = aws_security_group.this[*].arn
}
