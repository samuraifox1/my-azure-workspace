resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-test"
  location = var.resource_group_obj.location
  tags     = var.resource_group_obj.tags
}
