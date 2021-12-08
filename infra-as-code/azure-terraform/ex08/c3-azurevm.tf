# Creating Azure VM 

resource "azurerm_linux_virtual_machine" "vm-1-app-1" {
  name = "vm-1-app-1"
  computer_name = "dev-linux-vm"
  resource_group_name = azurerm_resource_group.rg-app1.name
  location = azurerm_resource_group.rg-app1.location
  size = "Standard_D2_v3"
  admin_username = "azureuser"
  #admin_password = "AzureAzure#123"
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/ubuntu-vm.public-key.pub")
  }

  network_interface_ids = [ azurerm_network_interface.interface-1.id ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  ## If you get error : Code="PlatformImageNotFound"
  ## Use the AZ Cli commend: az vm image list --output table
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # Custom Data to install webserver:
  custom_data = filebase64("${path.module}/install-web/webserver.txt")


}


## SSH into the VM: 
# ssh -i .\ssh-keys\ubuntu-vm.private-key.key azureuser@<publicip>
