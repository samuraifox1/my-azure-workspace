
# Terraform Cloud needs to Authenticate to Azure using Service Principal with a Client Secret
- [Azure Provider: Authenticating using a Service Principal with a Client Secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret) 
```t
# Azure CLI Login
az login

# Azure Account List
az account list
Observation:
1. Make a note of the value whose key is "id" which is nothing but your "subscription_id"

# Set Subscription ID
az account set --subscription="SUBSCRIPTION_ID"
az account set --subscription="___________"

# Create Service Principal & Client Secret
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/____________"

# Sample Output
{
  "appId": "___________",
  "displayName": "azure-cli-2021-06-15-15-41-54",
  "name": "http://azure-cli-2021-06-15-15-41-54",
  "password": "***********",
  "tenant": "tenanid"
}

# Observation
"appId" is the "client_id" defined above.
"password" is the "client_secret" defined above.
"tenant" is the "tenant_id" defined above.

# Verify
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID

az account list-locations -o table
az logout
```

```
{
  "appId": "___",
  "displayName": "azure-cli-2021-07-10-05-04-55",
  "name": "___",
  "password": "****",
  "tenant": "tenanid"
}
```

appId = ARM_CLIENT_ID
password = ARM_CLIENT_SECRET
tenant = ARM_TENANT_ID

az account list -o table
SubscriptionId = ARM_SUBSCRIPTION_ID

# Environment Variables for Terraform Cloud 
ARM_CLIENT_ID=___
ARM_CLIENT_SECRET=****
ARM_TENANT_ID=tenanid
ARM_SUBSCRIPTION_ID=subid



# Verify
az logout
az account list-locations -o table
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID
az login --service-principal -u ___ -p **** --tenant tenanid
az account list-locations -o table
az logout




# Delete the Azure AD CLI App Resgitration
*You must delete the CLI role added in oder to make your cloud secure once the job is done* 
https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredApps
