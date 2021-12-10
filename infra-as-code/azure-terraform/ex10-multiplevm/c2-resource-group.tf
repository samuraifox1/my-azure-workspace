
# Single Resource Group
resource "azurerm_resource_group" "myresgroup" {
    name = "resgroup-${random_string.random_string_5.id}"
    location = "eastus"
    tags = {
      "owner" = "rswarnka"
    }
}

