terraform {
  required_version = "~>1.0.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.88.0"
    }
  }
}

## Lets have first provider for West India

provider "azurerm" {
    features {
      
    }
  alias = "azure-westindia"
  # subscription_id = "Pay-As-You-Go" # it should be a GUID
}

## Lets have second provider for East India

provider "azurerm" {
    features {
      virtual_machine {
        graceful_shutdown = true
      }
    }
  alias = "azure-southindia"
  #subscription_id = "Pay-As-You-Go" # it should be a GUID
}


resource "azurerm_resource_group" "rg-southindia" {
  name = "rgsouthindia"
  location = "southindia"
  provider = azurerm.azure-southindia
}



resource "azurerm_resource_group" "rg-westindia" {
    name = "rgwestindia"
    location = "westindia"
    provider = azurerm.azure-westindia
 }
