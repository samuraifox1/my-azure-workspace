
/*
Steps: 
1. Create a dummy placeholder in tf file
2. Get the resource ID of the resource
/subscriptions/UUID/resourceGroups/resgroup-pqrs/providers/Microsoft.ContainerRegistry/registries/rswarnkaacr
3. Find import command from Terraform Provider documentation: 
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry#import
terraform import azurerm_container_registry.azureacr /subscriptions/bffb9b10-3e3c-486c-bb68-6ac0e94329f7/resourceGroups/resgroup-pqrs/providers/Microsoft.ContainerRegistry/registries/rswarnkaacr

*/

resource "azurerm_container_registry" "azureacr" {
  name = "rswarnkaacr"
  admin_enabled = false
  location= "centralindia"
  #login_server = "rswarnkaacr.azurecr.io"
  resource_group_name = "centralindia"
  
}