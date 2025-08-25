resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy

  tags = merge(
    var.global_tags,
    { Name = "${var.name}-vpc" }
  )

}
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.global_tags,
    { Name = "${var.name}-public-subnet-${count.index}" }
  )
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = merge(
    var.global_tags,
    { Name = "${var.name}-private-subnet-${count.index}" }
  )
}

