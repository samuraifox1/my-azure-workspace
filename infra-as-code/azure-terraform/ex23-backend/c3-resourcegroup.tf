resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup"
  location = "southindia"
  tags     = var.tags
}

 