# Outputs

output "api_id" {
  value = "${aws_api_gateway_rest_api.api.id}"
}

output "api_root_resource_id" {
  value = "${aws_api_gateway_rest_api.api.root_resource_id}"
}

output "domain_name" {
  value = "${coalesce(aws_api_gateway_domain_name.api_domain_acm.domain_name,aws_api_gateway_domain_name.api_domain_iam.domain_name)}"
}
