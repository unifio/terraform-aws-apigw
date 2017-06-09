# AWS API Gateway Stack

## Configures AWS provider
provider "aws" {
  region = "${var.region}"
}

## Configures API Gateway account
module "acct" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-apigw?ref=master//account"
  source = "../../account"

  iam_path         = "${var.iam_path}"
  stack_item_label = "${var.stack_item_label}"
}

## Confgures an API
module "api" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-apigw?ref=master//api"
  source = "../../api"

  api_description    = "${var.api_description}"
  api_name           = "${var.api_name}"
  binary_media_types = ["${split(",",var.binary_media_types)}"]
  certificate_name   = "${var.certificate_name}"
  certificate_type   = "${var.certificate_type}"
  domain_name        = "${var.domain_name}"
  provision_dns      = "false"
}
