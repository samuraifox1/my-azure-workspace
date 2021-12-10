

# Virtual Network

resource "azurerm_virtual_network" "myvnet" {
    name                = "vnet-${random_string.random_string_8.id}"
    resource_group_name = azurerm_resource_group.myresgroup.name
    location            = azurerm_resource_group.myresgroup.location
    address_space       = ["10.0.0.0/16"]
    tags = {
      "owner" = "rswarnka"
    }
}

# Subnet

resource "azurerm_subnet" "mysubnet" {
  name                 = "subnet-${random_string.random_string_8.id}"
  resource_group_name  = azurerm_resource_group.myresgroup.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.0.0/24"]
}


# Public IPs

resource "azurerm_public_ip" "mypublicips" {

  count               = 2
  name                = "publicip-${count.index}"
  resource_group_name = azurerm_resource_group.myresgroup.name
  location            = azurerm_resource_group.myresgroup.location
  allocation_method   = "Static"
  domain_name_label   = "app-vm${count.index}-${random_string.random_string_5.id}"
}

# NIC

resource "azurerm_network_interface" "myinterfaces" {
    count               = 2
    name                = "interface-${count.index}"
    resource_group_name = azurerm_resource_group.myresgroup.name
    location            = azurerm_resource_group.myresgroup.location

    ip_configuration {
      name                          = "internal" 
      subnet_id                     = azurerm_subnet.mysubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = element(azurerm_public_ip.mypublicips[*].id, count.index)

    }
}