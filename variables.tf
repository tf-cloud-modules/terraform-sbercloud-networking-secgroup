variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "create_sg" {
  description = "Controls if security group should be created."
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "ID of existing security group to manage."
  type        = string
  default     = null
}

variable "delete_default_rules" {
  description = "Controls if default rules should be deleted."
  type        = bool
  default     = true
}

variable "description" {
  description = "Specifies supplementary information about the security group. The value is a string of no more than 255 characters and cannot contain angle brackets."
  type        = string
  default     = null
}

variable "enterprise_project_id" {
  description = "Specifies the enterprise project id of the security group. Changing this creates a new security group."
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of the security group. The name must be unique for a tenant."
  type        = string
}

variable "region" {
  description = "Specifies the region in which to create the security group. If omitted, the provider-level region will be used. Changing this creates a new security group."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "List of ingress rules to create."
  type        = list(map(string))
  default     = []
}

variable "egress_rules" {
  description = "List of egress rules to create."
  type        = list(map(string))
  default     = []
}