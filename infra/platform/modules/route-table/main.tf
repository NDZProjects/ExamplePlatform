resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags   = merge(var.tags, { Name = var.name })
}

resource "aws_route" "this" {
  for_each = { for idx, route in var.routes : idx => route }

  route_table_id         = aws_route_table.this.id
  destination_cidr_block = each.value.cidr_block
  gateway_id             = lookup(each.value, "gateway_id", null)
  nat_gateway_id         = lookup(each.value, "nat_gateway_id", null)
}

resource "aws_route_table_association" "this" {
  for_each = toset(var.subnet_ids)

  subnet_id      = each.value
  route_table_id = aws_route_table.this.id
}