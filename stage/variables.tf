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

## REST API parameters
variable "api_id" {
  type        = "string"
  description = "The ID of the associated REST API."
}

## Stage / deployment parameters
variable "cache_cluster_enabled" {
  type        = "string"
  description = "Specifies whether a cache cluster is enabled for the stage."
  default     = "false"
}

variable "cache_cluster_size" {
  type        = "string"
  description = "The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237."
  default     = ""
}

variable "client_certificate_enabled" {
  type        = "string"
  description = "Flag for enabling the provisioning and association of a client certificate"
  default     = "false"
}

variable "deployment_id" {
  type        = "string"
  description = "ID of a subsequent deployment to associate with the stage"
  default     = ""
}

variable "documentation_version" {
  type        = "string"
  description = "The version of the associated API documentation."
  default     = ""
}

variable "stage_name" {
  type        = "string"
  description = "The name of the stage."
  default     = "live"
}

variable "variables" {
  type        = "map"
  description = "A map that defines the stage variables."
  default     = {}
}

## Domain mapping parameters
variable "domain_name" {
  type        = "string"
  description = "The already-registered domain name to connect the API to."
  default     = ""
}

variable "base_path" {
  type        = "string"
  description = "Path segment that must be prepended to the path when accessing the API via this mapping. If omitted, the API is exposed at the root of the given domain."
  default     = ""
}
