# terraform apply -var-file="secrets.tfvars"

resource "azurerm_mysql_server" "mysqlserver" {
  name                = "rswarnkardb${var.database_name}"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name

  administrator_login          = var.dbusername
  administrator_login_password = var.dbpassword

  sku_name   = "B_Gen5_1"
  storage_mb = var.db_storage_mb
  version    = "5.7"

  auto_grow_enabled                 = var.db_auto_grow_enabled
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  #ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags = var.common_tags
}

resource "azurerm_mysql_database" "app1db" {
  name                = "app1db"
  resource_group_name = azurerm_resource_group.resgroup.name
  server_name         = azurerm_mysql_server.mysqlserver.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
