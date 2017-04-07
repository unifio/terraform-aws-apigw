# Input Variables

## Resource tags
variable "stack_item_fullname" {
  type        = "string"
  description = "Long form descriptive name for this stack item. This value is used to create the 'application' resource tag for resources created by this stack item."
}

variable "stack_item_label" {
  type        = "string"
  description = "Short form identifier for this stack. This value is used to create the 'Name' resource tag for resources created by this stack item, and also serves as a unique key for re-use."
}

## API Gateway variables
variable "api_desc" {
  type        = "string"
  description = "Description for the API Gateway."
}

variable "api_path" {
  type        = "string"
  description = "The last path segment of this API resource."
}

variable "api_gateway_uri" {
  type        = "string"
  description = "The input's URI."
}

variable "api_http_method" {
  type        = "string"
  description = "The HTTP Method for the gateway resource."
}

variable "api_method_request_model" {
  type        = "string"
  description = "The request model for method for the gateway resource."
}

variable "api_method_request_parameters" {
  type        = "map"
  description = "The request parameters for method for the gateway resource."
}

variable "api_integration_request_parameters" {
  type        = "map"
  description = "The request parameters for integration for the gateway resource."
}

variable "api_http_integration_type" {
  type        = "string"
  description = "The integration input's type"
}

variable "api_authorization" {
  type        = "string"
  description = "The type of authorization used for the method."
}

variable "api_key_required" {
  type        = "string"
  description = "Specify if the method requires an API key."
}

variable "api_clients" {
  ##type	= "list"
  type        = "string"
  description = "List of clients to create API Keys."
}

variable "api_usage_plan" {
  type        = "string"
  description = "Name of the usage plan."
}

variable "api_usage_description" {
  type        = "string"
  description = "Description of the usage plan."
}

variable "api_usage_limit" {
  type        = "string"
  description = "Quota for API Usage."
}

variable "api_usage_offset" {
  type        = "string"
  description = "Quota offset for API Usage."
}

variable "api_usage_period" {
  type        = "string"
  description = "Quota period for API Usage."
}

variable "api_throttle_burst" {
  type        = "string"
  description = "Throttle burst for API Usage."
}

variable "api_throttle_limit" {
  type        = "string"
  description = "Throttle limit for API Usage."
}
