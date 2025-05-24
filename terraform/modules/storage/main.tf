resource "azurerm_resource_group" "example" {
  name     = "cc-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "cc-storage-acc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "cc_statefile" {
  name                  = "cc-statefile"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
