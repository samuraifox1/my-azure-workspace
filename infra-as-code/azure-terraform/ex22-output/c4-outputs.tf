
output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.resgroup.id
  sensitive = true
}

/*
PS H:\R-Local-DataStore\programming\my-azure-workspace\udemy\main> terraform output
resource_group_id = <sensitive>
PS H:\R-Local-DataStore\programming\my-azure-workspace\udemy\main> terraform output -json
{
  "resource_group_id": {
    "sensitive": true,
    "type": "string",
    "value": "/subscriptions/UUID/resourceGroups/resgroup-lmyzaj"
  }
}

*/