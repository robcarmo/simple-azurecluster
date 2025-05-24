output "aks_cluster_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.main.id
}

output "aks_cluster_name_output" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.main.name
}

output "kube_config_raw" {
  description = "Raw Kubernetes configuration for the AKS cluster. Sensitive."
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "The AKS cluster host."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.host
  sensitive   = true
}

output "client_certificate" {
  description = "The AKS cluster client certificate."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The AKS cluster client key."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The AKS cluster CA certificate."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate
  sensitive   = true
}
