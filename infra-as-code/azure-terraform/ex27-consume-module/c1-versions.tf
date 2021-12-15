
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = ">=2.60.0"
      source  = "hashicorp/azurerm"
    }
    random = {
      version = ">=3.1.0"
      source  = "hashicorp/random"
    }
  }
}


provider "azurerm" {
  features {}
}
provider "random" {

}