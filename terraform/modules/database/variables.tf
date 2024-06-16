variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "location" {
  description = "The location of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the PostgreSQL server"
  type        = string
}

variable "database_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}
