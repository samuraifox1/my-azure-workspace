resource "azurerm_container_registry" "myazureacr" {
  name = "aacr${random_string.random_string_8.id}"
  location = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  sku = "Basic"
  admin_enabled = false
  tags = {
    "created_via" = "terraform"
    "owner" = "rswarnka"
  }
  lifecycle {
    prevent_destroy = true
  }
}

/*
resource "azurerm_container_registry" "myazureacr" {
  name = "aacr${random_string.random_string_8.id}"
  location = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  sku = "Basic"
  admin_enabled = false
  tags = {
    "created_via" = "terraform"
    "owner" = "rswarnka"
    "env" = "dev"
  }
  lifecycle {
    ignore_changes = [tags, name]
  }
}
*/

