terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
        version = ">= 2.50.0"
        source = "hashicorp/azurerm"
    }
    
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

 
provider "random" {
  # Configuration options
}

resource "random" "myrandom" {
  upper = false 
  length = 8  
}
