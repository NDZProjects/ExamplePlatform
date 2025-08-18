module "iam_roles" {
  source = "../../modules/iam"
  
  for_each = var.iam_roles

  role_name               = each.value.role_name
  assume_role_policy      = each.value.assume_role_policy
  policy_arns            = each.value.policy_arns
  create_instance_profile = each.value.create_instance_profile
  instance_profile_name   = each.value.instance_profile_name
  tags                   = var.common_tags
}