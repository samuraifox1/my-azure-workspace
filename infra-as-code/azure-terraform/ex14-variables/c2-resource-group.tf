
resource "azurerm_resource_group" "resgroup" {

    name = "rg-${var.business_unit_code}-${var.environment}-${random_string.random_string_5.id}"
    location = "centralindia"
    tags = {
      "created_via" = var.created_by_tag
      "owner" = var.owner_tag
      "purpose" = var.purpose_tag
    }
}
