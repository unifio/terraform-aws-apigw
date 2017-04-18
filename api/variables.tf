# Input variables

## Resource tags
variable "api_label" {
  type        = "string"
  description = "Short form identifier for this API."
}

variable "stack_item_fullname" {
  type        = "string"
  description = "Long form descriptive name for this stack item. This value is used to create the 'application' resource tag for resources created by this stack item."
}

variable "stack_item_label" {
  type        = "string"
  description = "Short form identifier for this stack. This value is used to create the 'Name' resource tag for resources created by this stack item, and also serves as a unique key for re-use."
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
