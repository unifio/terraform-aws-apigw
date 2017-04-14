# AWS API Gateway Resource

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

## Creates an API resource
resource "aws_api_gateway_resource" "resource" {
  rest_api_id = "${var.api_id}"
  parent_id   = "${var.resource_parent_id}"
  path_part   = "${var.resource_path}"
}

## Method configuration for proxy types
module "proxy_method" {
  source = "../method"

  # API / resource parameters
  api_id      = "${var.api_id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"

  # Method parameters
  api_key_required   = "${var.api_key_required}"
  authorization      = "${var.authorization}"
  authorizer_id      = "${var.authorizer_id}"
  http_method        = "${var.integration_type == "AWS_PROXY" || var.integration_type == "HTTP_PROXY" ? var.http_method : ""}"
  request_parameters = "${var.request_parameters}"

  # Integration parameters
  integration_credentials        = "${var.integration_credentials}"
  integration_request_parameters = "${var.integration_request_parameters}"
  integration_request_templates  = "${var.integration_request_templates}"
  integration_type               = "${var.integration_type == "HTTP_PROXY" ? "HTTP_PROXY" : "AWS_PROXY"}"
  integration_uri                = "${var.integration_uri}"
}
