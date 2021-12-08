terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.88.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features{}
}


resource "azurerm_resource_group" "demo_rg" {
  location = "westindia"
  name = "demo_rg_1"
}

 
