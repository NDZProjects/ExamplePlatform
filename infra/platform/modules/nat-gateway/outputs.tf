output "nat_gateway_ids" {
  description = "The IDs of the created NAT Gateways."
  value       = aws_nat_gateway.this[*].id
}


output "nat_eip_ids" {
  description = "The IDs of the Elastic IPs associated with the NAT Gateways."
  value       = aws_eip.nat[*].id
}

output "nat_public_ips" {
  description = "The public IPs of the Elastic IPs associated with the NAT Gateways."
  value       = aws_eip.nat[*].public_ip
}

output "nat_gateway_subnet_ids" {
  description = "The IDs of the subnets where the NAT Gateways are deployed."
  value       = aws_nat_gateway.this.*.subnet_id
}
