data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

module "security_groups" {
  source = "../../modules/security-group"
  
  for_each = var.security_groups

  name          = each.value.name
  description   = each.value.description
  vpc_id        = data.aws_vpc.main.id
  ingress_rules = each.value.ingress_rules
  egress_rules  = each.value.egress_rules
  tags          = var.common_tags
}