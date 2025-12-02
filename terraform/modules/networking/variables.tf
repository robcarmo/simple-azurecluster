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

variable "vnet_name" {
  description = "The name for the virtual network."
  type        = string
  default     = "vnet-default"
}
