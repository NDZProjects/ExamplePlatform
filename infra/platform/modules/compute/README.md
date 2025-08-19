# README.md

## compute module

This module launches one or more EC2 instances.

### Usage

### Inputs

- `environment` (string)
- `ami_id` (string)
- `instance_type` (string)
- `subnet_ids` (list(string))
- `key_name` (string, optional)
- `vpc_security_group_ids` (list(string), optional)
- `instance_count` (number, default 1)
- `tags` (map(string), default `{}`)

### Outputs

- `instance_ids`
- `instance_public_ips`  