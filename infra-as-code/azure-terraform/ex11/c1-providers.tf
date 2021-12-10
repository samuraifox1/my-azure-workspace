
# Terraform Settings 

terraform {
  required_version = "~>1.0.0"
  required_providers {
    azurerm = {
        
        version = ">=2.50.0"
        source = "hashicorp/azurerm"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.1.0"
    }
  }
}

provider "azurerm" {
    features{}
}

provider "random" {
  
}



# Random string of 5 chars
resource "random_string" "random_string_5" {
  upper = false
  special = false
  length = 5  
}

# Random string of 8 chars
resource "random_string" "random_string_8" {
  upper = false
  special = false
  length = 8  
}


# Random string of 12 chars
resource "random_string" "random_string_12" {
  upper = false
  special = false
  length = 12  
}

