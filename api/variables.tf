# Input variables

## Resource tags
variable "api_name" {
  type        = "string"
  description = "Name for this API."
}

variable "api_description" {
  type        = "string"
  description = "Description for this API."
}

## REST API
variable "binary_media_types" {
  type        = "list"
  description = "The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
  default     = []
}

## Custom domain
variable "certificate_name" {
  type        = "string"
  description = "The unique name to use when registering this cert as an IAM server certificate."
  default     = ""
}

variable "certificate_provider_external_id" {
  type        = "string"
  description = "The external ID to use when making the AssumeRole call."
  default     = ""
}

variable "certificate_provider_role_arn" {
  type        = "string"
  description = "The ARN of the role to assume to lookup the certificate."
  default     = ""
}

variable "certificate_provider_session_name" {
  type        = "string"
  description = "The session name to use when making the AssumeRole call."
  default     = ""
}

variable "certificate_type" {
  type        = "string"
  description = "Managed certificate type. Valid values are 'acm' or 'iam'."
}

variable "domain_name" {
  type        = "string"
  description = "The fully-qualified domain name to register."
  default     = ""
}

variable "hosted_zone_id" {
  type        = "string"
  description = "The ID of the hosted zone to contain the domain name record."
  default     = ""
}

variable "provision_dns" {
  type        = "string"
  description = "Flag for enabling provisioning of the domain name in Route53."
  default     = "true"
}
