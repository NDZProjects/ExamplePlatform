output "eip_id" {
  description = "The ID of the Elastic IP."
  value       = aws_eip.this.id
}

output "eip_public_ip" {
  description = "The public IP of the Elastic IP."
  value       = aws_eip.this.public_ip
}

output "eip_allocation_id" {
  description = "The allocation ID of the Elastic IP, used for assigning it to resources like NAT Gateways."
  value       = aws_eip.this.id
}