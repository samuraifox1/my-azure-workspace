# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }

    # cloud {
    #   organization = "rswarnkar"
    #   workspaces {
    #     name = "sentinel-azure"
    #   }
    # }

  }
  # Terraform Backend pointed to TF Cloud
  backend "remote" {
    organization = "rswarnkar"
    workspaces {
      name = "sentinel-azure"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  number  = false
}


