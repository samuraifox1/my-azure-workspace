terraform {
  required_version = "~>1.0.0"
  required_providers {
    azurerm = {
        
        version = ">=2.50.0"
        source = "hashicorp/azurerm"
    }
  }


}

provider "azurerm" {
    features{}
}