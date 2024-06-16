output "kube_config" {
  value = module.aks.kube_config
}


output "database_id" {
  value = module.database.database_id
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_id" {
  value = module.networking.subnet_id
}

output "nsg_id" {
  value = module.networking.nsg_id
}

output "nic_id" {
  value = module.networking.nic_id
}

output "storage_account_id" {
  value = module.storage.storage_account_id
}

output "storage_container_id" {
  value = module.storage.storage_container_id
}

output "storage_blob_url" {
  value = module.storage.storage_blob_url
}

# output "app_insights_instrumentation_key" {
#   value = module.app_insights.instrumentation_key
# }

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "acr_admin_username" {
  value = module.acr.acr_admin_username
}

output "acr_admin_password" {
  value = module.acr.acr_admin_password
}
