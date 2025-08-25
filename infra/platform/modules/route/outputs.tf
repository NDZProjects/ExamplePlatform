output "route_id" {
  description = "The ID of the route created."
  value       = aws_route.this.id
}

output "destination_cidr_block" {
  description = "The destination CIDR block of the created route."
  value       = var.destination_cidr_block
}