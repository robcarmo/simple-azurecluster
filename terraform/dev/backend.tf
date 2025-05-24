terraform {
  backend "azurerm" {
    resource_group_name  = "cc-azure-rg"
    storage_account_name = "cc-storage-acc"
    container_name       = "cc-statefile"
    key                 = "terraform.tfstate"
  }
}
