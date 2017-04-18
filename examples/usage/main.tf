# AWS API Gateway usage plan example

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Configures an API usage plan
module "plan" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-apigw?ref=master//usage_plan"
  source = "../../usage_plan"

  api_id              = "${var.api_id}"
  stage_name          = "${var.stage_name}"
  plan_label          = "${var.plan_label}"
  stack_item_fullname = "${var.stack_item_fullname}"
  stack_item_label    = "${var.stack_item_label}"
}
