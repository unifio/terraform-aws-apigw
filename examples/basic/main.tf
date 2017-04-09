# AWS API Gateway

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Configures API Gateway
module "apigw_base" {
  source = "../../base"

  stack_item_fullname                = "${var.stack_item_fullname}"
  stack_item_label                   = "${var.stack_item_label}"
  api_desc                           = "${var.api_desc}"
  api_path                           = "${var.api_path}"
  api_http_method                    = "${var.api_http_method}"
  api_method_request_model           = "${var.api_method_request_model}"
  api_method_request_parameters      = "${var.api_method_request_parameters}"
  api_integration_request_parameters = "${var.api_integration_request_parameters}"
  api_http_integration_type          = "${var.api_http_integration_type}"
  api_authorization                  = "${var.api_authorization}"
  api_key_required                   = "${var.api_key_required}"
  api_gateway_uri                    = "${var.api_gateway_uri}"
  api_clients                        = "${var.api_clients}"
  api_usage_plan                     = "${var.api_usage_plan}"
  api_usage_description              = "${var.api_usage_description}"
  api_usage_limit                    = "${var.api_usage_limit}"
  api_usage_offset                   = "${var.api_usage_offset}"
  api_usage_period                   = "${var.api_usage_period}"
  api_throttle_burst                 = "${var.api_throttle_burst}"
  api_throttle_limit                 = "${var.api_throttle_limit}"
}
