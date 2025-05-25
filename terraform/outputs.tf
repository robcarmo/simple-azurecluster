output "resource_group_name" {
  description = "The name of the selected resource group." # Updated description
  value       = data.azurerm_resource_group.selected.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster."
  value       = module.aks.aks_cluster_name_output # Assuming the module has an output named 'aks_cluster_name_output'
}

output "acr_login_server" {
  description = "The login server for the ACR."
  value       = module.acr.acr_login_server_output # Assuming the module has an output named 'acr_login_server_output'
}

output "postgresql_server_fqdn" {
  description = "The FQDN of the PostgreSQL server."
  value       = module.database.postgresql_server_fqdn 
}
