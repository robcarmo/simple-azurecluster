resource "azurerm_postgresql_server" "postgresql" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_1"

  storage_mb            = 5120
  backup_retention_days = 7

  administrator_login          = var.admin_username
  administrator_login_password = "StrongPassword!123"

  version = "11"

  ssl_enforcement_enabled = true

}

resource "random_string" "suffix" {
  length  = 6
  special = false
}
resource "azurerm_postgresql_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
