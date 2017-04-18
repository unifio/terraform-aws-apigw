# Input variables

## API / resource parameters
variable "api_id" {
  type        = "string"
  description = "The ID of the associated REST API."
}

variable "resource_id" {
  type        = "string"
  description = "The API resource ID."
}

## Method parameters
variable "api_key_required" {
  type        = "string"
  description = "Specify if the method requires an API key."
  default     = "false"
}

variable "authorization" {
  type        = "string"
  description = "The type of authorization used for the method (NONE, CUSTOM, AWS_IAM)."
  default     = "NONE"
}

variable "authorizer_id" {
  type        = "string"
  description = "The authorizer id to be used when the authorization is CUSTOM."
  default     = ""
}

variable "http_method" {
  type        = "string"
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTION, ANY)."
  default     = ""
}

variable "request_models" {
  type        = "map"
  description = "A map of the API models used for the request's content type where key is the content type (e.g. application/json) and value is either Error, Empty (built-in models) or aws_api_gateway_model's name."
  default     = {}
}

variable "request_parameters" {
  type        = "map"
  description = "A map of request query string parameters and headers that should be passed to the integration."
  default     = {}
}

## Method response parameters
variable "method_response_status_code" {
  type        = "string"
  description = "The HTTP status code."
  default     = ""
}

## Integration parameters
variable "integration_credentials" {
  type        = "string"
  description = "The credentials required for the integration."
  default     = ""
}

variable "integration_http_method" {
  type        = "string"
  description = "The integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTION) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g. Lambda function can only be invoked via POST."
  default     = ""
}

variable "integration_passthrough_behavior" {
  type        = "string"
  description = "The integration passthrough behavior (WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER). Required if request_templates is used."
  default     = "WHEN_NO_MATCH"
}

variable "integration_request_content_handling" {
  type        = "string"
  description = "Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through."
  default     = ""
}

variable "integration_request_parameters" {
  type        = "map"
  description = "A map of request query string parameters and headers that should be passed to the backend responder."
  default     = {}
}

variable "integration_request_templates" {
  type        = "map"
  description = " A map of the integration's request templates."
  default     = {}
}

variable "integration_type" {
  type        = "string"
  description = "The integration input's type (HTTP, MOCK, AWS, AWS_PROXY, HTTP_PROXY)"
  default     = "AWS_PROXY"
}

variable "integration_uri" {
  type        = "string"
  description = "The input's URI (HTTP, AWS)."
  default     = ""
}

## Integration response
variable "integration_response_content_handling" {
  type        = "string"
  description = "Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the response payload will be passed through from the integration response to the method response without modification."
  default     = ""
}

variable "integration_response_parameters" {
  type        = "map"
  description = "A map of response parameters that can be read from the backend response."
  default     = {}
}

variable "integration_response_templates" {
  type        = "map"
  description = "A map specifying the templates used to transform the integration response body."
  default     = {}
}

variable "integration_response_selection_pattern" {
  type        = "string"
  description = "Specifies the regular expression pattern used to choose an integration response based on the response from the backend. If the backend is an AWS Lambda function, the AWS Lambda function error header is matched. For all other HTTP and AWS backends, the HTTP status code is matched."
  default     = ""
}

variable "integration_response_status_code" {
  type        = "string"
  description = "The HTTP status code."
  default     = ""
}
