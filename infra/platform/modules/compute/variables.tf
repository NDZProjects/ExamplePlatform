# variables.tf
variable "environment" {
  description = "Deployment environment name (e.g. stage-ndz-wrh)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances into"
  type        = list(string)
}

variable "key_name" {
  description = "Optional key pair name for SSH access"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to attach to instances"
  type        = list(string)
  default     = []
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Map of tags to apply to all created resources"
  type        = map(string)
  default     = {}
}