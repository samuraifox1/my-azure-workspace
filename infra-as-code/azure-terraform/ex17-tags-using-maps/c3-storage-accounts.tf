resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-${random_string.rand_string.id}"
  location = "southindia"
}

# Create managed disk for each environment 
resource "azurerm_managed_disk" "mdisks" {
  for_each             = var.managed_disk
  name                 = "disk${each.key}${random_string.rand_string.id}"
  location             = azurerm_resource_group.resgroup.location
  resource_group_name  = azurerm_resource_group.resgroup.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = each.value

  tags = var.mandatory_tags

}

