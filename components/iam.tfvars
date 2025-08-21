# IAM configuration
iam_roles = {
  ec2_ssm = {
    role_name = "${var.environment}-ec2-ssm-role"
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
      }]
    })
    policy_arns = [
      "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    ]
    create_instance_profile = true
    instance_profile_name = "${var.environment}-ec2-ssm-profile"
  }
}