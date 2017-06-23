# AWS API Gateway Method

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

## Creates an API method
resource "aws_api_gateway_method" "method" {
  count = "${length(var.http_method) > 0 ? "1" : "0"}"

  api_key_required   = "${var.api_key_required}"
  authorization      = "${upper(var.authorization)}"
  authorizer_id      = "${upper(var.authorization) == "CUSTOM" ? var.authorizer_id : ""}"
  http_method        = "${var.http_method}"
  request_models     = "${var.request_models}"
  request_parameters = "${var.request_parameters}"
  resource_id        = "${var.resource_id}"
  rest_api_id        = "${var.api_id}"
}

resource "aws_api_gateway_method_response" "method_response" {
  count = "${length(var.http_method) == 0 || var.integration_type == "AWS_PROXY" || var.integration_type == "HTTP_PROXY" ? "0" : "1"}"

  http_method         = "${aws_api_gateway_method.method.http_method}"
  resource_id         = "${var.resource_id}"
  rest_api_id         = "${var.api_id}"
  status_code         = "${var.method_response_status_code}"
  response_models     = "${var.method_response_models}"
  response_parameters = "${var.method_response_parameters}"
}

## Creates a method integration
resource "aws_api_gateway_integration" "integration" {
  count = "${(length(var.http_method) > 0 ? "1" : "0") * (length(var.integration_request_content_handling) > 0 ? "0" : "1")}"

  credentials             = "${var.integration_credentials}"
  http_method             = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "${length(var.integration_http_method) > 0 ? var.integration_http_method : aws_api_gateway_method.method.http_method}"
  passthrough_behavior    = "${var.integration_passthrough_behavior}"
  request_parameters      = "${var.integration_request_parameters}"
  request_templates       = "${var.integration_request_templates}"
  rest_api_id             = "${var.api_id}"
  resource_id             = "${var.resource_id}"
  type                    = "${var.integration_type}"
  uri                     = "${var.integration_uri}"
}

resource "aws_api_gateway_integration" "integration_content_handling" {
  count = "${(length(var.http_method) > 0 ? "1" : "0") * (length(var.integration_request_content_handling) > 0 ? "1" : "0")}"

  content_handling        = "${var.integration_request_content_handling}"
  credentials             = "${var.integration_credentials}"
  http_method             = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "${length(var.integration_http_method) > 0 ? var.integration_http_method : aws_api_gateway_method.method.http_method}"
  passthrough_behavior    = "${var.integration_passthrough_behavior}"
  request_parameters      = "${var.integration_request_parameters}"
  request_templates       = "${var.integration_request_templates}"
  rest_api_id             = "${var.api_id}"
  resource_id             = "${var.resource_id}"
  type                    = "${var.integration_type}"
  uri                     = "${var.integration_uri}"
}

resource "aws_api_gateway_integration_response" "integration_response" {
  count = "${(length(var.http_method) == 0 || var.integration_type == "AWS_PROXY" || var.integration_type == "HTTP_PROXY" ? "0" : "1") * (length(var.integration_response_content_handling) > 0 ? "0" : "1")}"

  http_method         = "${aws_api_gateway_method.method.http_method}"
  resource_id         = "${var.resource_id}"
  rest_api_id         = "${var.api_id}"
  response_parameters = "${var.integration_response_parameters}"
  response_templates  = "${var.integration_response_templates}"
  selection_pattern   = "${var.integration_response_selection_pattern}"
  status_code         = "${var.integration_response_status_code}"
}

resource "aws_api_gateway_integration_response" "integration_response_content_handling" {
  count = "${(var.integration_type == "AWS_PROXY" || var.integration_type == "HTTP_PROXY" ? "0" : "1") * (length(var.integration_response_content_handling) > 0 ? "1" : "0")}"

  content_handling    = "${var.integration_response_content_handling}"
  http_method         = "${aws_api_gateway_method.method.http_method}"
  resource_id         = "${var.resource_id}"
  rest_api_id         = "${var.api_id}"
  response_parameters = "${var.integration_response_parameters}"
  response_templates  = "${var.integration_response_templates}"
  selection_pattern   = "${var.integration_response_selection_pattern}"
  status_code         = "${var.integration_response_status_code}"
}
