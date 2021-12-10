
resource "azurerm_resource_group" "resgroup" {
  name     = "rg-${var.bu_code}-${random_string.randomsuffix_5.id}"
  location = var.location
  tags = {
    "owner"         = "${var.owner_tag}"
    "business_unit" = var.bu_code
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.bu_code}"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "owner"         = "${var.owner_tag}"
    "business_unit" = var.bu_code
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${random_string.randomsuffix_8.id}"
  resource_group_name  = azurerm_resource_group.resgroup.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  lifecycle {
    ignore_changes = [
      address_prefix
    ]
  }
}

resource "azurerm_public_ip" "publicip" {
  name                = "publicip-${random_string.randomsuffix_8.id}"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  allocation_method   = "Static"
  tags = {
    "owner"         = "${var.owner_tag}"
    "business_unit" = var.bu_code
  }

}


resource "azurerm_network_interface" "interface" {
  name                = "nic${random_string.randomsuffix_8.id}"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}