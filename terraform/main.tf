terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing_rg" { # Changed local name
  name = "cc-rg-new" # Hardcoded name
}

module "acr" {
  source = "./modules/acr"

  resource_group_name = data.azurerm_resource_group.existing_rg.name # Updated reference
  location            = data.azurerm_resource_group.existing_rg.location # Updated reference
  acr_name            = var.acr_name
}

module "aks" {
  source = "./modules/aks"

  resource_group_name = data.azurerm_resource_group.existing_rg.name # Updated reference
  location            = data.azurerm_resource_group.existing_rg.location # Updated reference
  aks_cluster_name    = var.aks_cluster_name
  kubernetes_version  = var.aks_kubernetes_version 
  node_vm_size        = var.aks_node_vm_size       
  node_count          = var.aks_node_count         
}

module "database" {
  source = "./modules/database"

  resource_group_name       = data.azurerm_resource_group.existing_rg.name # Updated reference
  location                  = data.azurerm_resource_group.existing_rg.location # Updated reference
  postgresql_server_name    = var.postgresql_server_name
  postgresql_admin_login    = var.postgresql_admin_login
  postgresql_admin_password = var.postgresql_admin_password
  postgresql_sku_name       = var.postgresql_sku_name
  postgresql_version        = var.postgresql_version
  postgresql_storage_mb     = var.postgresql_storage_mb
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = data.azurerm_resource_group.existing_rg.name # Updated reference
  location             = data.azurerm_resource_group.existing_rg.location # Updated reference
  storage_account_name = var.storage_account_name
  module_enabled       = var.storage_module_enabled 
}

module "app_insights" {
  source = "./modules/app-insights"

  resource_group_name = data.azurerm_resource_group.existing_rg.name # Updated reference
  location            = data.azurerm_resource_group.existing_rg.location # Updated reference
  app_insights_name   = var.app_insights_name
  module_enabled      = var.app_insights_module_enabled
}

module "networking" {
  source = "./modules/networking"

  resource_group_name = data.azurerm_resource_group.existing_rg.name # Updated reference
  location            = data.azurerm_resource_group.existing_rg.location # Updated reference
  vnet_name           = var.vnet_name
  module_enabled      = var.networking_module_enabled
}

module "log_analytics" {
  source = "./modules/log-analytics"

  resource_group_name          = data.azurerm_resource_group.existing_rg.name # Updated reference
  location                     = data.azurerm_resource_group.existing_rg.location # Updated reference
  log_analytics_workspace_name = var.log_analytics_workspace_name
  module_enabled               = var.log_analytics_module_enabled
}
```
