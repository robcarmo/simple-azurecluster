output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}
output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
