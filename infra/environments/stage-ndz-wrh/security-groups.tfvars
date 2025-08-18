# Security Groups configuration
security_groups = {
  web = {
    name        = "${var.environment}-web-sg"
    description = "Security group for web servers"
    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  
  app = {
    name        = "${var.environment}-app-sg"
    description = "Security group for application servers"
    ingress_rules = [
      {
        from_port   = 4000
        to_port     = 4002
        protocol    = "tcp"
        cidr_blocks = ["10.122.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}