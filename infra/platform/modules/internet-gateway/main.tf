
resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    var.global_tags,
    { Name = var.internet_gateway_name }
  )
}