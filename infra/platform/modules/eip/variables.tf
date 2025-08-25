variable "tags" {
  description = "Map of tags to assign to the Elastic IP."
  type        = map(string)
  default     = {}
}