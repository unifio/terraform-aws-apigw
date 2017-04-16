# Input variables

## Resource tags
variable "plan_label" {
  type        = "string"
  description = "Short form identifier for this usage plan."
}

variable "stack_item_fullname" {
  type        = "string"
  description = "Long form descriptive name for this stack item. This value is used to create the 'application' resource tag for resources created by this stack item."
}

variable "stack_item_label" {
  type        = "string"
  description = "Short form identifier for this stack. This value is used to create the 'Name' resource tag for resources created by this stack item, and also serves as a unique key for re-use."
}

## Rest API / stage parameters
variable "api_id" {
  type        = "string"
  description = "The ID of the associated REST API."
}

variable "stage_name" {
  type        = "string"
  description = "API stage name of the associated API stage in a usage plan"
}

## Usage plan parameters
variable "quota_limit" {
  type        = "string"
  description = "The maximum number of requests that can be made in a given time period."
  default     = "1000000"
}

variable "quota_offset" {
  type        = "string"
  description = "The number of requests subtracted from the given limit in the initial time period."
  default     = "0"
}

variable "quota_period" {
  type        = "string"
  description = "The time period in which the limit applies. Valid values are 'DAY', 'WEEK' or 'MONTH'."
  default     = "DAY"
}

variable "throttle_burst_limit" {
  type        = "string"
  description = "The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity."
  default     = "2000"
}

variable "throttle_rate_limit" {
  type        = "string"
  description = "The API request steady-state rate limit."
  default     = "1000"
}

## API key parameters
variable "key_enabled" {
  type        = "string"
  description = "Specifies whether the API key can be used by callers."
  default     = "true"
}
