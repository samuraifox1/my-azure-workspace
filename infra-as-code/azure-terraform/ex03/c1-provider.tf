
terraform {
  required_version = "~> 1.0"
  required_providers {
    my-azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
     }
  }
}

provider "my-azurerm" {

    features {
      
    }
  
}