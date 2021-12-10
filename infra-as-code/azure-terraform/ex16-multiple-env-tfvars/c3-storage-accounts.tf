resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-${random_string.randomsuffix_5.id}"
  location = "southindia"
}

resource "azurerm_storage_account" "storage_acc" {
  for_each                 = toset(var.replica_locations)
  resource_group_name      = azurerm_resource_group.resgroup.name
  location                 = each.key
  name                     = "sa${random_string.randomsuffix_5.id}${each.value}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}


