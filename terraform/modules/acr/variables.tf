variable "resource_group_name" {
  description = "The name of the resource group in which to create the ACR."
  type        = string
}

variable "location" {
  description = "The Azure region where the ACR will be created."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry. Must be globally unique."
  type        = string
  default     = "acrsampleunique" # Will likely be overridden by root module with a more unique name
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry. Examples: Basic, Standard, Premium."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled for the ACR. Default is false."
  type        = bool
  default     = false # Recommended to keep false and use service principals or managed identities
}
