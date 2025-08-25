# REST API specific configuration
stage_name           = "${var.environment}-idlms"
log_retention_days   = 7
api_description      = "Stage REST API to NLB"
binary_media_types   = ["*/*"]

# API Gateway settings
throttling_rate_limit  = 300
throttling_burst_limit = 800
metrics_enabled      = true
logging_level        = "INFO"
data_trace_enabled   = false

# Application configuration
api_port = 4000
