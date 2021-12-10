resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup"
  location = var.allowed_location
}

