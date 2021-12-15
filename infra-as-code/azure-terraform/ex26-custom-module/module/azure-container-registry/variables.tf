## All Variables (inputs) should be defined in this 

variable "resource_group_name" {
  description = "Resource group in which ACR to be created"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "azure_container_registry_name" {
  description = "Name of the Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "SKU (Basic, Standard, Premium)"
  type        = string
}

variable "admin_enabled" {
  type        = bool
  description = "Admin enabled (true, false)"
  default     = false
}

