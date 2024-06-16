variable "name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "location" {
  description = "The location of the Log Analytics Workspace"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "aks_id" {
  description = "The ID of the AKS cluster"
  type        = string
}

