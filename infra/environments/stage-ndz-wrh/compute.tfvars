providers = { aws = aws }

# EC2 and compute configuration
ami_id               = "ami-01f23391a59163da9"
instance_type        = "t2.micro"
app_ports           = [4000, 4001, 4002]

# IAM configuration
ec2_ssm_profile_name = "${var.environment}-ec2_ssm_profile"
ec2_ssm_role_name    = "ec2_ssm_role-${var.environment}"

# Storage configuration
docker_artifact_bucket = "idlms-${var.environment}-built-artifact-014125597127"

# EC2 tags
ec2_tags = {
  Name = "Backend API IDLMS-${var.environment}"
}