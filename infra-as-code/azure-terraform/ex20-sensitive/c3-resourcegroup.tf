resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-${random_string.rand_string.id}"
  location = var.location
  tags     = var.common_tags
}
