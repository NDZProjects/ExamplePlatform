output "route_table_ids" {
  description = "IDs of created route tables"
  value       = { for k, v in module.route_tables : k => v.route_table_id }
}