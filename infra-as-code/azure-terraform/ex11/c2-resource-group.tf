# Resource Group

resource "azurerm_resource_group" "resource_group1" {
  count = 3
  name = "resg-${random_string.random_string_5}-${count.index}"
  location = "eastus"
}


