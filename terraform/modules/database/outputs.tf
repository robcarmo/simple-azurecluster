output "postgresql_server_id" {
  description = "The ID of the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.main.id
}

output "postgresql_server_fqdn" {
  description = "The FQDN of the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "postgresql_server_name_output" {
  description = "The Name of the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.main.name
}
