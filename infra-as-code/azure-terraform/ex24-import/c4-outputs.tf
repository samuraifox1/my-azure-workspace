
output "azureacr_login_url" {
  description = "Azure ACR "
  value = azurerm_container_registry.azureacr.login_server
}
