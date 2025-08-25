resource "aws_eip" "this" {
  vpc = true # Indicates that the Elastic IP is for use in a VPC

  # Optional tags for managing resources
  tags = var.tags
}