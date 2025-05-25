variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL server."
  type        = string
}

variable "location" {
  description = "The Azure region where the PostgreSQL server will be created."
  type        = string
}

variable "postgresql_server_name" {
  description = "The name of the PostgreSQL server."
  type        = string
  default     = "psql-server-unique" # Consider making this more unique if needed
}

variable "postgresql_admin_login" {
  description = "The admin login username for the PostgreSQL server."
  type        = string
  default     = "psqladmin"
}

variable "postgresql_admin_password" {
  description = "The admin login password for the PostgreSQL server."
  type        = string
  sensitive   = true
  # No default, should be provided from root module
}

variable "postgresql_sku_name" {
  description = "The SKU name for the PostgreSQL Flexible Server. Examples: B_Standard_B1ms, GP_Standard_D2s_v3."
  type        = string
  default     = "B_Standard_B1ms" # Burstable, 1 vCore, 2 GiB RAM
}

variable "postgresql_version" {
  description = "The version of PostgreSQL to deploy."
  type        = string
  default     = "13" # Or "11", "12", "14", "15", "16"
}

variable "postgresql_storage_mb" {
  description = "The maximum storage capacity in MB for the PostgreSQL server. Minimum 32768 (32 GB)."
  type        = number
  default     = 32768 # 32GB
}

variable "backup_retention_days" {
  description = "Backup retention days for the server."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable Geo-redundant backups for server."
  type        = bool
  default     = false
}
