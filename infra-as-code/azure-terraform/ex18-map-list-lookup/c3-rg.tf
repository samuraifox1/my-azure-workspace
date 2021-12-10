resource "azurerm_resource_group" "resgroup" {
  name     = "resgroup-${lookup(var.rg_map, var.env_type)}"
  location = lookup(var.rg_map, var.env_type)
}

## terraform plan -var "env_type=prod" -out prodplan.tfplan
## terraform plan -out poc-auto.tfplan