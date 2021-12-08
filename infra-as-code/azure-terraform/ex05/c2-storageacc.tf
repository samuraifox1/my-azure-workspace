resource "azurerm_resource_group" "myrg01" {
  name = "myrg01"
  location = "southindia"
}


resource "random_string" "rstring" {
  length = 12
  upper = false
  special = false 

}

 resource "azurerm_storage_account" "storage-acc1" {

   name = "sa${random_string.rstring.id}"
   resource_group_name = azurerm_resource_group.myrg01.name
   location = azurerm_resource_group.myrg01.location

   account_tier = "Standard"
   account_replication_type = "LRS"
    
   tags ={
     env = "test"
   }
   
 }