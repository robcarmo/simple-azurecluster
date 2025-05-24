output "storage_account_id" {
  description = "The ID of the storage account."
  value       = var.module_enabled ? azurerm_storage_account.main[0].id : null
}

output "storage_account_name_output" { # Renamed to avoid conflict with variable name if it were an input
  description = "The name of the storage account."
  value       = var.module_enabled ? azurerm_storage_account.main[0].name : null
}

output "storage_container_name_output" { # Renamed
  description = "The name of the storage container created."
  value       = var.module_enabled ? azurerm_storage_container.main[0].name : null
}
