
# NAT Gateway Elastic IP
resource "aws_eip" "nat" {
  tags = merge(
    #var.global_tags,
    { Name = "${var.environment}-nat-eip-${count.index + 1}" }
  )
  count = var.nat_count
}

# NAT Gateway (creates one in each public subnet if count > 1)
resource "aws_nat_gateway" "this" {
  count         = var.nat_count
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]
  connectivity_type = var.connectivity_type

  tags = merge(
    #var.global_tags,
    { Name = "${var.environment}-nat-gateway-${count.index + 1}" }
  )
}