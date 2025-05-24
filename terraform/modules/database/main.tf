resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.postgresql_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.postgresql_version
  administrator_login    = var.postgresql_admin_login
  administrator_password = var.postgresql_admin_password
  sku_name               = var.postgresql_sku_name # Use sku_name instead of deprecated sku_tier, sku_capacity, sku_family

  storage_mb                   = var.postgresql_storage_mb
  backup_retention_days      = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  # For simplicity, allow public access from any Azure service and disable SSL enforcement.
  # In a production environment, configure VNet integration or private endpoints,
  # and enforce SSL.
  public_network_access_enabled = true # Set to false for private access
  ssl_enforcement_enabled       = false # Set to true in production

  # Flexible server requires zone to be set, or high_availability to be configured
  zone = "1" # Or other availability zone like "2", "3". Pick one available in your region.


  tags = {
    environment = "sample_app_env"
    project     = "Sample Nodejs App"
  }
}

# Example: Firewall rule to allow access from any Azure service
# This is often too permissive for production.
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureInternal"
  server_id        = azurerm_postgresql_flexible_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# It's good practice to also allow access for your current client IP for management/testing,
# but this should be handled carefully, perhaps via a variable or manual configuration.
# resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_my_ip" {
#   name             = "AllowMyClientIP"
#   server_id        = azurerm_postgresql_flexible_server.main.id
#   start_ip_address = "YOUR_CLIENT_IP_ADDRESS" # Replace with actual IP or use a data source
#   end_ip_address   = "YOUR_CLIENT_IP_ADDRESS" # Replace with actual IP or use a data source
# }
