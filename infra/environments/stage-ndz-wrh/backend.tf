terraform {
  backend "s3" {
    #bucket         = var.backend_bucket          # e.g. "my-terraform-states"
    bucket         = "var-backend-bucket"          # e.g. "my-terraform-states"
    #key            = "${var.environment}/terraform.tfstate"
    key            = "var_environment/terraform.tfstate"
    region         = "eu-west-1"              # e.g. "eu-west-1"
    encrypt        = true
  }
}