
# 1 Resource Group
resource "azurerm_resource_group" "rg-test" {
    name = "vnettest"
    location = "westindia"
    tags = {
      "owner" = "rswarnka"
    }
}


# 2 VNet 

resource "azurerm_virtual_network" "vnet-01" {
    name = "main-vnet-01"
    resource_group_name = azurerm_resource_group.rg-test.name
    location = azurerm_resource_group.rg-test.location
    address_space = ["10.0.0.0/16"]

    tags = {
      "owner" = "rswarnka"
    }
}

# 3 Subnet

resource "azurerm_subnet" "subnet1" {
  name = "subnet1"
  resource_group_name = azurerm_resource_group.rg-test.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes = ["10.0.1.0/24"]

}


# 4 Public IP

resource "azurerm_public_ip" "public-ip-1" {
  name = "public-ip-1"
  resource_group_name = azurerm_resource_group.rg-test.name
  location = azurerm_resource_group.rg-test.location
  allocation_method = "Static"
}

# 5 NIC
resource "azurerm_network_interface" "interface-1" {
    name = "interface-1"
    location = azurerm_resource_group.rg-test.location
    resource_group_name = azurerm_resource_group.rg-test.name

    ip_configuration {
      name = "internal-ip"
      subnet_id = azurerm_subnet.subnet1.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.public-ip-1.id

    }

  
}