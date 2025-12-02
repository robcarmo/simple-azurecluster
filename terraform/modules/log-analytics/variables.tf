variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "module_enabled" {
  description = "Flag to enable/disable this module's resources."
  type        = bool
  default     = false # Disabled by default
}

variable "log_analytics_workspace_name" {
  description = "The name for the Log Analytics workspace."
  type        = string
  default     = "logws-default"
}
