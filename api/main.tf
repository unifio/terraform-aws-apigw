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

### Amazon Certificate Manager (ACM) certificate
#### API Gateway current only supports sourcing ACM certificates from the us-east-1 region.
provider "aws" {
  alias  = "ue1"
  region = "us-east-1"
}

data "aws_acm_certificate" "cert" {
  count    = "${length(var.domain_name) > 0 && var.certificate_type == "acm" ? "1" : "0"}"
  provider = "aws.ue1"

  domain = "${var.certificate_name}"
}

resource "aws_api_gateway_domain_name" "api_domain_acm" {
  count = "${length(var.domain_name) > 0 && var.certificate_type == "acm" ? "1" : "0"}"

  certificate_arn = "${data.aws_acm_certificate.cert.arn}"
  domain_name     = "${var.domain_name}"
}

### Identity and Access Management (IAM) certificate
data "aws_iam_server_certificate" "cert" {
  count = "${length(var.domain_name) > 0 && var.certificate_type == "iam" ? "1" : "0"}"

  latest = true
  name   = "${var.certificate_name}"
}

resource "aws_api_gateway_domain_name" "api_domain_iam" {
  count = "${length(var.domain_name) > 0 && var.certificate_type == "iam" ? "1" : "0"}"

  certificate_arn = "${data.aws_iam_server_certificate.cert.arn}"
  domain_name     = "${var.domain_name}"
}

## Updates Route53 DNS
resource "aws_route53_record" "api_dns" {
  count = "${length(var.domain_name) > 0 && var.provision_dns == "true" ? "1" : "0"}"

  name    = "${coalesce(aws_api_gateway_domain_name.api_domain_acm.domain_name,aws_api_gateway_domain_name.api_domain_iam.domain_name)}"
  type    = "A"
  zone_id = "${var.hosted_zone_id}"

  alias {
    evaluate_target_health = true
    name                   = "${coalesce(aws_api_gateway_domain_name.api_domain_acm.cloudfront_domain_name,aws_api_gateway_domain_name.api_domain_iam.cloudfront_domain_name)}"
    zone_id                = "${coalesce(aws_api_gateway_domain_name.api_domain_acm.cloudfront_zone_id,aws_api_gateway_domain_name.api_domain_iam.cloudfront_zone_id)}"
  }
}

## TODO: Provisions and associates an authorizer

