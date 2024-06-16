resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.workspace.location
  resource_group_name   = azurerm_log_analytics_workspace.workspace.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_monitor_diagnostic_setting" "aks_diagnostics" {
  name                      = "aks-diagnostics"
  target_resource_id        = var.aks_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  log {
    category = "kube-apiserver"
    enabled  = true
  }

  log {
    category = "kube-controller-manager"   
    enabled  = true
  }

  log {
    category = "kube-scheduler"
    enabled  = true
  }
  log {
    category = "kube-audit"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

