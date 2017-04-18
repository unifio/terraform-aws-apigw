# AWS API Gateway Usage Plan

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

## Creates an API usage plan & key
resource "aws_api_gateway_usage_plan" "plan" {
  name        = "${var.plan_label}-${var.stack_item_label}"
  description = "${var.stack_item_fullname}"

  api_stages {
    api_id = "${var.api_id}"
    stage  = "${var.stage_name}"
  }

  quota_settings {
    limit  = "${var.quota_limit}"
    offset = "${var.quota_offset}"
    period = "${upper(var.quota_period)}"
  }

  throttle_settings {
    burst_limit = "${var.throttle_burst_limit}"
    rate_limit  = "${var.throttle_rate_limit}"
  }
}

resource "aws_api_gateway_api_key" "key" {
  description = "${var.stack_item_fullname}"
  enabled     = "${var.key_enabled}"
  name        = "${var.plan_label}-${var.stack_item_label}"
}

resource "aws_api_gateway_usage_plan_key" "key_assoc" {
  key_id        = "${aws_api_gateway_api_key.key.id}"
  key_type      = "API_KEY"
  usage_plan_id = "${aws_api_gateway_usage_plan.plan.id}"
}
