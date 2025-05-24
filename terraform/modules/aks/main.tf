resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
    # os_disk_size_gb = 30 # Optional: specify OS disk size
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.min_node_count
    max_count           = var.max_node_count
  }

  identity {
    type = "SystemAssigned"
  }

  # Optional: Network Profile (e.g., for Azure CNI)
  # network_profile {
  #   network_plugin    = "azure"
  #   service_cidr      = "10.0.0.0/16"
  #   dns_service_ip    = "10.0.0.10"
  #   docker_bridge_cidr = "172.17.0.1/16"
  # }

  tags = {
    environment = "sample_app_env"
    project     = "Sample Nodejs App"
  }
}
