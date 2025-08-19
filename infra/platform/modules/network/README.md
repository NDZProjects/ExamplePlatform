# Network Module

This module creates a VPC and one subnet per AZ.

## Usage

## Inputs

- `environment` (string)
- `cidr_block` (string)
- `azs` (list(string))
- `subnet_mask_bits` (number, default 8)
- `tags` (map(string), default `{}`)

## Outputs

- `vpc_id`
- `subnet_ids`