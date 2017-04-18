# AWS API Gateway Account

## Set Terraform version constraint
terraform {
  required_version = ">= 0.9.3"
}

data "aws_region" "current" {
  current = true
}

## Creates IAM role for service integrations
data "aws_iam_policy_document" "role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = "${data.aws_iam_policy_document.role.json}"
  name_prefix        = "apigw-${var.stack_item_label}-${data.aws_region.current.name}-"
  path               = "${var.iam_path}"
}

### Creates logging policy
data "aws_iam_policy_document" "logging" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents",
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "logging" {
  name   = "logging"
  policy = "${data.aws_iam_policy_document.logging.json}"
  role   = "${aws_iam_role.role.id}"
}

## Configures API gateway for the region
resource "aws_api_gateway_account" "account" {
  cloudwatch_role_arn = "${aws_iam_role.role.arn}"
}
