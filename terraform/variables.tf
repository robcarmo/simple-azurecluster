  variable "resource_group_name" {
  description = "The name of the resource group where resources will be created."
  type        = string
  default     = "cc-rg-new"
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "East US" # Or any preferred region
}

# This file (terraform/variables.tf) can be expanded or used if variables
# are moved out of main.tf for better organization.

# variable "resource_group_name" {
#   description = "The name of the resource group where resources will be created."
#   type        = string
#   default     = "rg-sample-app-infra"
# }

# variable "location" {
#   description = "The Azure region where resources will be created."
#   type        = string
#   default     = "East US"
# }

variable "acr_name_suffix" {
  description = "A suffix to ensure ACR name uniqueness if not using random_id directly in module."
  type        = string
  default     = "sampleacr" # Example, consider a better unique naming strategy
}

variable "postgresql_admin_password_placeholder" {
  description = "Placeholder for PostgreSQL admin password. Should be overridden with a secure value."
  type        = string
  default     = "ReplaceThisSecurely123!"
  sensitive   = true
}

variable "postgresql_admin_password" {
  description = "PostgreSQL admin password. Must be provided via environment variable TF_VAR_postgresql_admin_password or tfvars file."
  type        = string
  sensitive   = true
}
