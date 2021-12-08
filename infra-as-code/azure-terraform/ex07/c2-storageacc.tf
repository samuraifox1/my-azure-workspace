
# Azure Resource Group
resource "azurerm_resource_group" "rgtest02" {
  name = "rgtest02"
  location = "westindia"
  tags = {
      "owner" = "rswarnka"
  }
}

# random string 

resource "random_string" "rand_str" {
  length = 10
  special =  false
  upper = false
}


# Azure Storage Account
resource "azurerm_storage_account" "storage-account-1" {
  name = "stor${random_string.rand_str.id}"
  account_tier = "Standard"
  location = azurerm_resource_group.rgtest02.location
  account_replication_type = "LRS"
  resource_group_name = azurerm_resource_group.rgtest02.name

}
