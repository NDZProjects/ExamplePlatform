variable "iam_roles" {
  description = "Map of IAM roles to create"
  type = map(object({
    role_name               = string
    assume_role_policy      = string
    policy_arns            = list(string)
    create_instance_profile = bool
    instance_profile_name   = string
  }))
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}