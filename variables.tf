#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-lifecycle-manager"
  description = "Terraform current module repo"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "create_lifecycle_policy" {
  type        = bool
  default     = true
  description = "Manage Enable or Disable the module."
}
variable "resource_types" {
  type        = list(any)
  default     = []
  description = "A list of resource types that should be targeted by the lifecycle policy. VOLUME is currently the only allowed value."
}

variable "interval" {
  type        = number
  default     = null
  description = "How often this lifecycle policy should be evaluated. 1, 2,3,4,6,8,12 or 24 are valid values."
}

variable "interval_unit" {
  type        = string
  default     = ""
  description = "The unit for how often the lifecycle policy should be evaluated. HOURS is currently the only allowed value and also the default value."
}

variable "times" {
  type        = list(any)
  default     = []
  description = " A list of times in 24 hour clock format that sets when the lifecycle policy should be evaluated. Max of 1."
}

variable "count-number" {
  type        = number
  default     = null
  description = " How many snapshots to keep. Must be an integer between 1 and 1000."
}

variable "SnapshotCreator" {
  type        = string
  default     = ""
  description = "Policy details for customer values."
}

variable "policy_details" {
  type        = bool
  default     = true
  description = "Policy details for customer values."
}

variable "copy_tags" {
  type        = string
  default     = ""
  description = "tags of false and true."
}

variable "target_tags" {
  type        = map(any)
  default     = {}
  description = "tags of false and true."
}