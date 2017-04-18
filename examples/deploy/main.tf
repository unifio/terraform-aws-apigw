# AWS API Gateway stage example

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Configures an API stage
module "stage" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-apigw?ref=master//stage"
  source = "../../stage"

  api_label           = "${var.api_label}"
  api_id              = "${var.api_id}"
  deployment_id       = "${aws_api_gateway_deployment.release.id}"
  domain_name         = "${var.domain_name}"
  stack_item_fullname = "${var.stack_item_fullname}"
  stack_item_label    = "${var.stack_item_label}"
}

## Creates a new deployment
resource "aws_api_gateway_deployment" "release" {
  description = "v1.0.0"
  rest_api_id = "${var.api_id}"
  stage_name  = "${module.stage.stage_name}"
}
