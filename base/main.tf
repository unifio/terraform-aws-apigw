# AWS API Gateway Configuration

## Set Terraform version constraint
terraform {
  required_version = "> 0.8.0"
}

## Creates cloudconfig fragments for tagging
data "aws_region" "current" {
  current = true
}

## Creates API Gateway
resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = "${var.stack_item_label}-api"
  description = "${var.api_desc}"
}

## Configures reources
resource "aws_api_gateway_resource" "api_gw_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.api_gateway.id}"
  parent_id   = "${aws_api_gateway_rest_api.api_gateway.root_resource_id}"
  path_part   = "${var.api_path}"
}

resource "aws_api_gateway_method" "api_gw_method" {
  rest_api_id      = "${aws_api_gateway_rest_api.api_gateway.id}"
  resource_id      = "${aws_api_gateway_resource.api_gw_resource.id}"
  http_method      = "${var.api_http_method}"
  authorization    = "${var.api_authorization}"
  api_key_required = "${var.api_key_required}"

  request_models = {
    "application/json" = "${var.api_method_request_model}"
  }

  request_parameters = "${var.api_method_request_parameters}"
}

resource "aws_api_gateway_integration" "api_gw_int" {
  rest_api_id             = "${aws_api_gateway_rest_api.api_gateway.id}"
  resource_id             = "${aws_api_gateway_resource.api_gw_resource.id}"
  integration_http_method = "${aws_api_gateway_method.api_gw_method.http_method}"
  request_parameters      = "${var.api_integration_request_parameters}"
  http_method             = "${var.api_http_method}"
  type                    = "${var.api_http_integration_type}"
  uri                     = "${var.api_gateway_uri}"
}

resource "aws_api_gateway_integration_response" "200" {
  depends_on  = ["aws_api_gateway_method.api_gw_method", "aws_api_gateway_integration.api_gw_int"]
  rest_api_id = "${aws_api_gateway_rest_api.api_gateway.id}"
  resource_id = "${aws_api_gateway_resource.api_gw_resource.id}"
  http_method = "${aws_api_gateway_method.api_gw_method.http_method}"
  status_code = "200"
}

## Deploy the API Gateway
resource "aws_api_gateway_deployment" "api_gw_deploy" {
  depends_on = ["aws_api_gateway_method.api_gw_method", "aws_api_gateway_integration.api_gw_int"]

  rest_api_id = "${aws_api_gateway_rest_api.api_gateway.id}"
  stage_name  = "${var.stack_item_label}"
}

##resource "aws_api_gateway_api_key" "api_key" {
##  count                   = "${length(keys(var.api_clients))}"
##  name = "${element(values(var.api_clients), count.index)}"
##
##  stage_key {
##    rest_api_id = "${aws_api_gateway_rest_api.api_gateway.id}"
##    stage_name  = "${aws_api_gateway_deployment.api_gw_deploy.stage_name}"
##  }
##}

resource "aws_api_gateway_api_key" "api_key" {
  name = "${var.api_clients}"

  stage_key {
    rest_api_id = "${aws_api_gateway_rest_api.api_gateway.id}"
    stage_name  = "${aws_api_gateway_deployment.api_gw_deploy.stage_name}"
  }
}
