A service principal is automatically created by Azure Pipeline when you connect to an Azure subscription from inside a pipeline definition or when you create a new service connection from the project settings page. You can also manually create the service principal from the portal or using Azure CLI and re-use it across projects. 

az ad sp create-for-rbac --name <service-principal-name>


az account show --query id --output tsv
az account show --query name --output tsv

