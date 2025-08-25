# CloudWatch specific configuration
log_group_tag_name    = "${var.environment}-DockerAPI"
ssm_param_name        = "/${var.environment}-cloudwatch/docker-config"
docker_log_group_name = "/${var.environment}/docker/api"
ssm_tag_name          = "${var.environment}-docker-cloudwatch-config"
