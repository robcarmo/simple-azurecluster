variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "sample-aks-cluster"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
  default     = "1.32.0" // Check for latest stable versions
}

variable "node_vm_size" {
  description = "The VM size for the AKS cluster nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster's default node pool."
  type        = number
  default     = 2
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling for the default node pool."
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "Minimum number of nodes for auto scaling."
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for auto scaling."
  type        = number
  default     = 3
}

variable "dns_prefix" {
  description = "Optional DNS prefix for the AKS cluster."
  type        = string
  default     = "sampleaks" # Must be unique across Azure
}
