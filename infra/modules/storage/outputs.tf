output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "container_name" {
  value = azurerm_storage_container.cc_statefile.name
}
