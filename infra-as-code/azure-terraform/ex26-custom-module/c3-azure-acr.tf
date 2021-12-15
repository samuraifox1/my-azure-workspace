
# Modules name is of our choice 
module "azure_acr" {
    source = "./module/azure-container-registry"

    # resource group related
    resource_group_name           = "resgroup-pqrs"
    location                      = "centralindia"
    
    # azure acr related
    azure_container_registry_name = "rswarnka"
    acr_sku                       = "Basic"
    admin_enabled                 = false
    
}