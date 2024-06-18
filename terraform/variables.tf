variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default = "akstestgroup"
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default = "eastus"
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
  default     = "standard_b2pls_v2"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}
