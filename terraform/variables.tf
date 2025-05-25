variable "existing_resource_group_name" {
  description = "The name of the existing resource group to use."
  type        = string
  default     = "cc-rg-new"
}

variable "acr_name" {
  description = "The globally unique name for the Azure Container Registry."
  type        = string
  default     = "acrSampleUniqueName" # Replace with a globally unique name
}

variable "aks_cluster_name" {
  description = "The name for the AKS cluster."
  type        = string
  default     = "aks-sample-cluster"
}

variable "aks_kubernetes_version" {
  description = "The Kubernetes version for the AKS cluster."
  type        = string
  default     = "1.27.7"
}

variable "aks_node_vm_size" {
  description = "The VM size for AKS cluster nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "aks_node_count" {
  description = "The number of nodes for the AKS cluster default pool (if not auto-scaling)."
  type        = number
  default     = 2
}

variable "postgresql_server_name" {
  description = "The name for the PostgreSQL server."
  type        = string
  default     = "psql-flexibleserver-sample" # Needs to be unique
}

variable "postgresql_admin_login" {
  description = "The admin login for the PostgreSQL server."
  type        = string
  default     = "psqladmin"
}

variable "postgresql_admin_password" {
  description = "The admin password for the PostgreSQL server. Choose a strong password."
  type        = string
  sensitive   = true
  # No default - user must provide this, e.g., via a .tfvars file or environment variable
}

variable "postgresql_sku_name" {
  description = "The SKU for the PostgreSQL server."
  type        = string
  default     = "B_Standard_B1ms" # Default from module
}

variable "postgresql_version" {
  description = "The PostgreSQL version."
  type        = string
  default     = "13" # Default from module
}

variable "postgresql_storage_mb" {
  description = "Storage for PostgreSQL server in MB."
  type        = number
  default     = 32768 # Default from module (32GB)
}

variable "storage_account_name" {
  description = "The globally unique name for the Azure Storage Account."
  type        = string
  default     = "stsampleaccunique" # Replace with a globally unique name
}

variable "app_insights_name" {
  description = "The name for the Application Insights instance."
  type        = string
  default     = "appi-sample"
}

variable "vnet_name" {
  description = "The name for the Virtual Network."
  type        = string
  default     = "vnet-sample"
}

variable "log_analytics_workspace_name" {
  description = "The name for the Log Analytics workspace."
  type        = string
  default     = "logws-sample"
}

# Module Enablement Flags
variable "storage_module_enabled" {
  description = "Flag to enable/disable the storage module."
  type        = bool
  default     = true
}

variable "app_insights_module_enabled" {
  description = "Flag to enable/disable the App Insights module."
  type        = bool
  default     = false
}

variable "networking_module_enabled" {
  description = "Flag to enable/disable the networking module."
  type        = bool
  default     = false
}

variable "log_analytics_module_enabled" {
  description = "Flag to enable/disable the Log Analytics module."
  type        = bool
  default     = false
}
```
