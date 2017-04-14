# Input variables

## Resource parameters
variable "api_id" {
  type        = "string"
  description = "The ID of the associated REST API."
}

variable "resource_parent_id" {
  type        = "string"
  description = "The ID of the parent API resource."
}

variable "resource_path" {
  type        = "string"
  description = "The last path segment of this API resource."
}

## Method parameters
variable "api_key_required" {
  type    = "string"
  default = "false"
}

variable "authorization" {
  type    = "string"
  default = "NONE"
}

variable "authorizer_id" {
  type    = "string"
  default = ""
}

variable "http_method" {
  type    = "string"
  default = "ANY"
}

variable "request_parameters" {
  type    = "map"
  default = {}
}

## Integration parameters
variable "integration_credentials" {
  type    = "string"
  default = ""
}

variable "integration_request_parameters" {
  type    = "map"
  default = {}
}

variable "integration_request_templates" {
  type    = "map"
  default = {}
}

variable "integration_type" {
  type    = "string"
  default = "AWS_PROXY"
}

variable "integration_uri" {
  type = "string"
}
