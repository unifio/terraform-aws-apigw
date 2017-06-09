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

  api_id              = "${var.api_id}"
  domain_name         = "${var.domain_name}"
  stack_item_fullname = "${var.stack_item_fullname}"
  stack_item_label    = "${var.stack_item_label}"
}
