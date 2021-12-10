
# Using for each set 
resource "azurerm_resource_group" "resgroup1" {

    for_each = {
      dc1app = "southindia"
      dc2app = "centralindia"
    }

    name = "resgroup1-${each.key}"
    location = "${each.value}"
    tags = {
      "created_via" = "block1"
    }
}

## Using toset(list[]) funxtion 

resource "azurerm_resource_group" "resgroup2" {

    for_each = toset(["southindia", "centralindia"])

    name = "resgroup2-${each.key}"
    location = "${each.value}"
    tags = {
      "created_via" = "block2"
    }
}