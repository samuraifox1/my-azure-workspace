


resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-${random_string.randomsuffix_8.id}"
  resource_group_name = azurerm_resource_group.resgroup.name
  location            = azurerm_resource_group.resgroup.location
  size                = "Standard_D3_v2" ## az vm list-sizes --location "centralindia" -otable

  network_interface_ids           = [azurerm_network_interface.interface.id]
  admin_username                  = "adminuser"
  admin_password                  = "AzureAzure#123" ## WARNING SECURITY ISSUE
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"

  }
}