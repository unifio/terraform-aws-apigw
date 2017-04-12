# Input variables

variable "iam_path" {
  type        = "string"
  description = "The path to the IAM resources."
}

variable "stack_item_label" {
  type        = "string"
  description = "Short form identifier for this stack. This value is used to create the 'Name' resource tag for resources created by this stack item, and also serves as a unique key for re-use."
}
