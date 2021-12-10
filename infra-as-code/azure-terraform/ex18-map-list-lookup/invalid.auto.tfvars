env_type = "gggg"

/*
│ Error: Error in function call
│
│   on c3-rg.tf line 3, in resource "azurerm_resource_group" "resgroup":
│    3:   location = lookup(var.rg_map, var.env_type)
│     ├────────────────
│     │ var.env_type is "gggg"
│     │ var.rg_map is map of string with 3 elements
│
│ Call to function "lookup" failed: lookup failed to find 'gggg'.
*/