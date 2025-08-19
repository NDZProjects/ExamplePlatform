variable "environment" {
  description = "The target environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
}

variable "backend_bucket" {
  description = "S3 bucket name for Terraform state"
  type        = string
}

variable "availability_zones" {
  description = "List of AZs to use for networking"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "network_cidr" {
  description = "CIDR block for the VPC"
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