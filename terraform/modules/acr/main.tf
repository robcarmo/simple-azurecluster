resource "azurerm_container_registry" "main" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled

  tags = {
    environment = "sample_app_env"
    project     = "Sample Nodejs App"
  }
}
