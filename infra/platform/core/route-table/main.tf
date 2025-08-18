data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

module "route_tables" {
  source = "../../modules/route-table"
  
  for_each = var.route_tables

  name       = each.value.name
  vpc_id     = data.aws_vpc.main.id
  routes     = each.value.routes
  subnet_ids = each.value.subnet_ids
  tags       = var.common_tags
}