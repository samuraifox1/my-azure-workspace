# Creating Azure VMs

resource "azurerm_linux_virtual_machine" "myvms" {
  count               = 2
  name                = "dev-linux-vm-${count.index}"
  computer_name       = "dev-linux-vm-${count.index}"
  resource_group_name = azurerm_resource_group.myresgroup.name
  location            = azurerm_resource_group.myresgroup.location
  size                = "Standard_D2_v3"
  admin_username      = "azureuser"
  # admin_password    = "AzureAzure#123"  ## WARNING SECURITY RISK
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/ubuntu-vm.public-key.pub")  ## WARNING Keys must not leak into github or git cache
  }

  network_interface_ids = [element(azurerm_network_interface.myinterfaces[*].id, count.index)]
  
  os_disk {
    name                 = "osdisk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/install-web/webserver.txt")
}

