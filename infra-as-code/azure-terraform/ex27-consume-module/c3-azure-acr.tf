
# Modules name is of our choice 
module "azure_acr" {
    #source = "./module/azure-container-registry"
    # https://registry.terraform.io/modules/samuraifox1/azureacrdemo/azurerm/latest?tab=resources

    source  = "samuraifox1/azureacrdemo/azurerm"
    version = "1.0.0"

    # resource group related
    resource_group_name           = "resgroup-pqrs"
    location                      = "centralindia"
    
    # azure acr related
    azure_container_registry_name = "rswarnka"
    acr_sku                       = "Basic"
    admin_enabled                 = false
    
}

/*
PS H:\R-Local-DataStore\programming\my-azure-workspace\udemy\.terraform\modules> cat  .\.terraform\modules.json
{"Modules":[{"Key":"","Source":"","Dir":"."},{"Key":"azure_acr","Source":"samuraifox1/azureacrdemo/azurerm","Version":"1.0.0","Dir":".terraform/modules/azure_acr"}]}

*/