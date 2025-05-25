resource "azurerm_storage_account" "main" {
  count                    = var.module_enabled ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "sample_app_env" # Example tag
  }
}

resource "azurerm_storage_container" "main" {
  count                  = var.module_enabled ? 1 : 0
  name                   = "tfstate" # Default container name for Terraform state, can be made variable
  storage_account_name   = azurerm_storage_account.main[0].name # Index due to count
  container_access_type  = "private"
}
