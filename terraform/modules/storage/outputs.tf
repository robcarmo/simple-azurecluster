output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_container_id" {
  value = azurerm_storage_container.storage_container.id
}

output "storage_blob_url" {
  value = azurerm_storage_blob.blob.url
}