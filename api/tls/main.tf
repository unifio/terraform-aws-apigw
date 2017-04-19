# AWS API Gateway TLS

### Amazon Certificate Manager (ACM) certificate
#### API Gateway current only supports sourcing ACM certificates from the us-east-1 region.
provider "aws" {
  alias  = "ue1"
  region = "us-east-1"
}

data "aws_acm_certificate" "cert" {
  count    = "${var.domain_enabled == "true" && var.certificate_type == "acm" ? "1" : "0"}"
  provider = "aws.ue1"

  domain = "${var.certificate_name}"
}

### Identity and Access Management (IAM) certificate
data "aws_iam_server_certificate" "cert" {
  count = "${var.domain_enabled == "true" && var.certificate_type == "iam" ? "1" : "0"}"

  latest = true
  name   = "${var.certificate_name}"
}
