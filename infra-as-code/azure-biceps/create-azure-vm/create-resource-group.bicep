targetScope = 'subscription'

@description('Name of the resource group between 3-20 characters')
@minLength(3)
@maxLength(20)
param rgName string


@description('Location of the Resource group (Only India Regions allowed)')
@allowed([
  'centralindia'
  'southindia'
  'westindia'
])
param rgLocation string = 'centralindia'


param tags object = {
  'createdVia': 'azure bicep'
}

resource new_resource 'Microsoft.Resources/resourceGroups@2018-05-01' = {
  location: rgLocation
  name: rgName
  tags: tags
}


/*
List of commands to deploy `ex-03-bicep-first` example:

az bicep install
az login
az account set --subscription "Pay-As-You-Go"
az account set --subscription {your subscription ID}
az account list --refresh --query "[?contains(name, 'Pay-As-You-Go')].id"  --output table
az configure --defaults group=azure-iac
az deployment group create --template-file main.bicep # this is wrong
az deployment sub create --template-file main.bicep # this is right
az deployment sub validate --location centralindia --template-file create-resource-group.bicep
az deployment sub validate --location centralindia --template-file create-resource-group.bicep --output table
az deployment sub create --location centralindia --template-file create-resource-group.bicep

az deployment sub validate --location centralindia --template-file create-resource-group.bicep --output table | grep Succeeded | head -1 | cut -d'"' -f4

echo 'Succeeded  d0875a4f-bd00-4edc-a83c-e83a71d6c334'

*/
