# AWS API Gateway proxy example

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Configures a proxy resource
module "proxy" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-apigw?ref=master//resource"
  source = "../../resource"

  api_id                         = "${var.api_id}"
  api_key_required               = "${var.api_key_required}"
  integration_request_parameters = "${map(var.integration_request_parameter,var.request_parameter)}"
  integration_type               = "${var.integration_type}"
  integration_uri                = "${var.integration_uri}"
  request_parameters             = "${map(var.request_parameter,true)}"
  resource_parent_id             = "${var.api_root_resource_id}"
  resource_path                  = "${var.resource_path}"
}
