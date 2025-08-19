module "network" {
  source                               = "../../modules/network"
  azs                                  = var.availability_zones
  cidr_block                           = var.cidr_block
  default_network_acl_ingress_rules    = var.default_network_acl_ingress_rules
  default_network_acl_egress_rules     = var.default_network_acl_egress_rules
  default_security_group_ingress_rules = var.default_security_group_ingress_rules
  vpc_id = module.network.vpc_id

}
