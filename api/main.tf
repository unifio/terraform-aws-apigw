# AWS API Gateway REST API

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

## Creates API
resource "aws_api_gateway_rest_api" "api" {
  binary_media_types = "${compact(var.binary_media_types)}"
  description        = "${var.stack_item_fullname}"
  name               = "${var.api_label}-${var.stack_item_label}"
}

## Creates and associates a custom domain
module "tls" {
  source = "tls"

  certificate_name = "${var.certificate_name}"
  certificate_type = "${var.certificate_type}"
  domain_enabled   = "${length(var.domain_name) > 0 ? "true" : "false"}"
}

resource "aws_api_gateway_domain_name" "api_domain" {
  count = "${length(var.domain_name) > 0 ? "1" : "0"}"

  certificate_arn = "${module.tls.certificate_arn}"
  domain_name     = "${var.domain_name}"
}

## Updates Route53 DNS
resource "aws_route53_record" "api_dns" {
  count = "${length(var.domain_name) > 0 && var.provision_dns == "true" ? "1" : "0"}"

  name    = "${aws_api_gateway_domain_name.api_domain.domain_name}"
  type    = "A"
  zone_id = "${var.hosted_zone_id}"

  alias {
    evaluate_target_health = true
    name                   = "${aws_api_gateway_domain_name.api_domain.cloudfront_domain_name}"
    zone_id                = "${aws_api_gateway_domain_name.api_domain.cloudfront_zone_id}"
  }
}

## TODO: Provisions and associates an authorizer

