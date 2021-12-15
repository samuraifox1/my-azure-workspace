
output "mod_login_server_url" {
  description = "The URL that can be used to log into the container registry"
  value       = azurerm_container_registry.azure_acr.login_server
}

output "mod_acr_resource_id" {

  description = "The ID of the Container Registry"
  value       = azurerm_container_registry.azure_acr.id
}