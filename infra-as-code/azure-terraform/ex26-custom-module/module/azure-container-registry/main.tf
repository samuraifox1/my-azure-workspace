# random append
resource "random_string" "myrandom" {
  length  = 7
  upper   = false
  special = false
  number  = false
}

resource "azurerm_container_registry" "azure_acr" {
  name                = "${var.azure_container_registry_name}${random_string.myrandom.id}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled

}


/*
 
 # Azure Container Registry Module

## About this module:
This is sample module to test how to create and publish terraform modules 
to the terraform registry. 

## Steps to create modules: 
1. Move your reusabel code to the `module/<module>`

 */