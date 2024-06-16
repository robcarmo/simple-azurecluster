variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "vm_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
}

# variable "log_analytics_workspace_id" {
#   description = "The ID of the Log Analytics Workspace"
#   type        = string
# }

variable "acr_id" {
  description = "The ID of the Azure Container Registry"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}