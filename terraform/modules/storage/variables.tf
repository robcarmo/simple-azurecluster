variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created."
  type        = string
  # No default, should be provided by the calling module
}

variable "location" {
  description = "Azure region where the storage account will be created."
  type        = string
  # No default, should be provided by the calling module
}

variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique."
  type        = string
  default     = "stdefaultunique" # Default, but expected to be overridden
}

variable "module_enabled" {
  description = "Flag to enable/disable this module's resources."
  type        = bool
  default     = true # Assuming storage is generally useful
}
