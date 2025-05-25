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

# main.tf (or data.tf)

data "azurerm_resource_group" "existing_rg" { # Changed the local name to avoid confusion
  name = "cc-rg-new" # The exact name of your existing resource group
}

module "acr" {
  source = "./modules/acr"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  acr_name            = "acrsample${random_id.suffix.hex}" # Example name, consider a better naming convention
}

module "aks" {
  source = "./modules/aks"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  aks_cluster_name    = "aks-sample-cluster" # Example name
  kubernetes_version  = "1.27.7"             # Example version
  node_vm_size        = "Standard_DS2_v2"
  node_count          = 2
}

module "database" {
  source = "./modules/database"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  postgresql_server_name = "psql-${var.resource_group_name}" # Example name
  postgresql_admin_login    = "psqladmin"
  postgresql_admin_password = "Password123!" # Replace with a secure password, ideally from a variable or secret
  # Add other necessary variables like sku_name, storage_mb, version
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  storage_account_name = "stsample${random_id.suffix.hex}" # Example name
  # Add other necessary variables
}

# Placeholder modules (minimal configuration)
module "app_insights" {
  source = "./modules/app-insights"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  app_insights_name   = "appi-${var.resource_group_name}"
}

module "networking" {
  source = "./modules/networking"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  vnet_name           = "vnet-sample"
}

module "log_analytics" {
  source = "./modules/log-analytics"

  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  log_analytics_workspace_name = "logws-${var.resource_group_name}"
}

# Used for generating unique names for resources that require it
resource "random_id" "suffix" {
  byte_length = 4
}
