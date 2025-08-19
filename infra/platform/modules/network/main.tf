resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags       = merge(var.tags, { Name = "${var.environment}-vpc" })
}

resource "aws_subnet" "this" {
  for_each = toset(var.azs)

  vpc_id            = aws_vpc.this.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(var.cidr_block, var.subnet_mask_bits, index(var.azs, each.key))
  tags              = merge(var.tags, { Name = "${var.environment}-subnet-${each.key}" })
}
