# Outputs

output "certificate_arn" {
  value = "${coalesce(join(",",data.aws_acm_certificate.cert.*.arn),join(",",data.aws_iam_server_certificate.cert.*.arn))}"
}
