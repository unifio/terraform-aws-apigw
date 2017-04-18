# AWS API Gateway Stage

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

data "aws_region" "current" {
  current = true
}

## Creates an API stage & deployment
resource "aws_api_gateway_stage" "stage" {
  count = "${var.client_certificate_enabled == "true" ? "0" : "1"}"

  cache_cluster_enabled = "${var.cache_cluster_enabled}"
  cache_cluster_size    = "${var.cache_cluster_size}"
  deployment_id         = "${length(var.deployment_id) > 0 ? var.deployment_id : aws_api_gateway_deployment.initial.id}"
  description           = "${var.stack_item_fullname}"
  documentation_version = "${var.documentation_version}"
  rest_api_id           = "${var.api_id}"
  stage_name            = "${var.stage_name}"
  variables             = "${var.variables}"
}

resource "aws_api_gateway_stage" "stage_cert" {
  count = "${var.client_certificate_enabled == "true" ? "1" : "0"}"

  cache_cluster_enabled = "${var.cache_cluster_enabled}"
  cache_cluster_size    = "${var.cache_cluster_size}"
  client_certificate_id = "${aws_api_gateway_client_certificate.cert.id}"
  deployment_id         = "${length(var.deployment_id) > 0 ? var.deployment_id : aws_api_gateway_deployment.initial.id}"
  description           = "${var.stack_item_fullname}"
  documentation_version = "${var.documentation_version}"
  rest_api_id           = "${var.api_id}"
  stage_name            = "${var.stage_name}"
  variables             = "${var.variables}"
}

resource "aws_api_gateway_deployment" "initial" {
  description       = "Initial deployment"
  rest_api_id       = "${var.api_id}"
  stage_description = "API initialization"
  stage_name        = "init"
}

## Creates client certificate
resource "aws_api_gateway_client_certificate" "cert" {
  count = "${var.client_certificate_enabled == "true" ? "1" : "0"}"

  description = "${var.api_label}-${var.stack_item_label}-${var.stage_name}"
}

## Enabled custom domain path mapping
resource "aws_api_gateway_base_path_mapping" "domain_map" {
  count = "${length(var.domain_name) > 0 ? "1" : "0"}"

  api_id      = "${var.api_id}"
  base_path   = "${var.base_path}"
  domain_name = "${var.domain_name}"
  stage_name  = "${var.stage_name}"
}
