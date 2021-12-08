
# 1 Resource Group
resource "azurerm_resource_group" "rg-app1" {
    name = "rgapp1"
    location = "eastus"
    tags = {
      "owner" = "rswarnka"
    }
}


# 2 VNet 

resource "azurerm_virtual_network" "vnet-1" {
    name = "vnet-1"
    resource_group_name = azurerm_resource_group.rg-app1.name
    location = azurerm_resource_group.rg-app1.location
    address_space = ["172.16.0.0/16"]

    tags = {
      "owner" = "rswarnka"
    }
}

# 3 Subnet

resource "azurerm_subnet" "subnet-1" {
  name = "subnet-1"
  resource_group_name = azurerm_resource_group.rg-app1.name
  virtual_network_name = azurerm_virtual_network.vnet-1.name
  address_prefixes = ["172.16.0.0/24"]

}


# 4 Public IP

resource "azurerm_public_ip" "public-ip-1" {
  name = "public-ip-1"
  resource_group_name = azurerm_resource_group.rg-app1.name
  location = azurerm_resource_group.rg-app1.location
  allocation_method = "Static"

  # If YOU DON'T ADD BELOW, Ip will not be accessibel: 
  domain_name_label = "app1-vm-${random_string.myrandom.id}"


  # Public IP should be created only after creation of the Vnet and Subnet
  depends_on = [
    azurerm_subnet.subnet-1, azurerm_virtual_network.vnet-1
  ]
}

# 5 NIC



resource "azurerm_network_interface" "interface-1" {
    name = "interface-1"
    location = azurerm_resource_group.rg-app1.location
    resource_group_name = azurerm_resource_group.rg-app1.name

    ip_configuration {
      name = "internal"  ## Code="IpConfigDeleteNotSupported" Message="IP Configuration internal-ip cannot be deleted. Deletion and renaming of primary IP Configuration is not supported
      subnet_id = azurerm_subnet.subnet-1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.public-ip-1.id

    }

  
}