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

  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "swarnkatfstate"
    container_name       = "tfstatefiles"
    key                  = "project1/prod.terrform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

provider "random" {

}