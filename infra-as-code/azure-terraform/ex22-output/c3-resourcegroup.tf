resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-${random_string.rand_string.id}"  
  location = var.allowed_location
  tags     = var.tags
}


