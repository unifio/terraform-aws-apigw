# Input variables

## Resource tags
variable "api_label" {
  type = "string"
}

variable "stack_item_fullname" {
  type = "string"
}

variable "stack_item_label" {
  type = "string"
}

## Account parameters
variable "iam_path" {
  type = "string"
}

variable "region" {
  type = "string"
}

## REST API parameters
variable "binary_media_types" {
  type    = "string"
  default = ""
}

variable "certificate_name" {
  type = "string"
}

variable "certificate_type" {
  type = "string"
}

variable "domain_name" {
  type    = "string"
  default = ""
}
