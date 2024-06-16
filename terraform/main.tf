provider "azurerm" {
  features {}
  version = ">= 3.0.0"
  client_id     = "ba07f6d1-900b-4999-815b-f254eeb62a12"
  client_secret = "9bJ8Q~dn5qqPNqWwqwxw7fGliFlBUgTjA0A2VcrO"
  tenant_id     = "7cb0244d-1f9d-408c-b688-be905dab183d"
  subscription_id = "bc8787fc-2fc4-4fef-beee-ca04fdd4e384"
  #skip_provider_registration = true
}


resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "log_analytics" {
  source              = "./modules/log-analytics"
  name                = "my-log-analytics-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  aks_id              = module.aks.aks_id
}

module "app_insights" {
  source              = "./modules/app-insights"
  name                = "my-app-insights-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = "myacr${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [azurerm_resource_group.main]
}

module "aks" {
  source                     = "./modules/aks"
  cluster_name               = "akstest-${var.environment}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  acr_id                     = module.acr.acr_id
  environment                = var.environment
  depends_on = [azurerm_resource_group.main]
}
module "database" {
  source              = "./modules/database"
  server_name         =  "pgbltest2024"
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = "adminuser"
  admin_password      = "securepassword"
  database_name       = "mydatabase-${var.environment}"
  depends_on = [azurerm_resource_group.main]
}


module "networking" {
  source              = "./modules/networking"
  vnet_name           = "vnet-${var.environment}"
  subnet_name         = "subnet-${var.environment}"
  nsg_name            = "nsg-${var.environment}"
  nic_name            = "nic-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [azurerm_resource_group.main]
}

module "storage" {
  source                  = "./modules/storage"
  storage_account_name    = "stgeacc${var.environment}"
  storage_container_name  = "container${var.environment}"
  blob_name               = "blob${var.environment}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  depends_on = [azurerm_resource_group.main]
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}