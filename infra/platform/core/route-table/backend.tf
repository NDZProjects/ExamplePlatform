terraform {
  backend "s3" {
    bucket = var.tf_state_bucket
    key    = "route-tables/terraform.tfstate"
    region = var.tf_state_region
  }
}