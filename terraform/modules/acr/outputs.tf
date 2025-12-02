output "acr_id" {
  description = "The ID of the ACR."
  value       = azurerm_container_registry.main.id
}

output "acr_name_output" {
  description = "The name of the ACR."
  value       = azurerm_container_registry.main.name
}

output "acr_login_server_output" {
  description = "The login server of the ACR (e.g., myregistry.azurecr.io)."
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "The admin username for the ACR. Only available if admin_enabled is true."
  value       = var.admin_enabled ? azurerm_container_registry.main.admin_username : null
  sensitive   = true
}

output "admin_password" {
  description = "The admin password for the ACR. Only available if admin_enabled is true."
  value       = var.admin_enabled ? azurerm_container_registry.main.admin_password : null
  sensitive   = true
}
