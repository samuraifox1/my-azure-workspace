
output "root_login_server_url" {
  description = "The URL that can be used to log into the container registry"
  value       = module.azure_acr.mod_login_server_url
}

output "root_acr_resource_id" {
  description = "The ID of the Container Registry"
  value       = module.azure_acr.mod_acr_resource_id
}