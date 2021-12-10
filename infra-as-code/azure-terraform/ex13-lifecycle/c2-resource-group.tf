
resource "azurerm_resource_group" "resgroup" {

    name = "resgroup-${random_string.random_string_5.id}"
    location = "centralindia"
    tags = {
      "created_via" = "terraform"
    }
}
