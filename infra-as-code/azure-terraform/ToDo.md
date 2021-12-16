# Terraform for Azure Cloud

## Key Commands:
`terraform init`
`terraform validate`
`terraform plan`
`terraform plan -out plan1.tfplan`
`terraform apply`
`terraform destroy`
`terraform apply --destroy`
`terraform console`
`terraform show`
`terraform fmt`
`terraform providers mirror`
`terraform state list`
`terraform output`
`terraform output -json`
`terraform refresh`
`terraform providers`
`terraform providers lock`
`terraform providers mirror`
`terraform providers schema`
`terraform graph`
`terraform state mv`
`terraform state rm`
`terraform state pull`
`terraform state push`
`terraform force-unlock`
`terraform taint`
`terraform untaint`
`terraform workspace`
`terraform workspace show`
`terraform workspace list`
`terraform workspace new`
`terraform workspace select`
`terraform workspace delete`
`terraform import`
`terraform get`
`terraform login` : to log into private module registry from CLI
`terraform logout` to log into private module registry from CLI

---

## TO DO

1. Create Modules to generate Random names from predefined list of {Flowers, Docker container names, Indian Citiesm World cities, Person names, list of sci-fi movie names from 2000 etc}
2. Publish your module as module creator on Terraform Registry community 
3. Terraform IAC Ready VM: Create a project to spawn a WIndows VM with Git, Visual Studio Code and Terraform installed
4. Find use cases for for_each chaining
5. Create Terraform project to host Python Web Server to run Python Django website on Azure Virtual Machine 
6. Create Terraform project to deploy Azure container registry and Azure Container instance 
7. Freelancing work for Terraform 
8. Create terraform project to spawn a Windows VM with Python Anaconda Installed for Python Jupyter developement purpose 
9. Always use plan before the apply. And Always save the plan to outfile as backup
10. Populate storage account with maximum disaster recovery options for an application hosted in australia region (Hint use the auto.tfvars with map object)
11. map of string in auto.tfvars: For applying the `Common Tags` to all azure resources 
12. Do not check out the `*.tfvars` and `*.tfstate` and `*.tfstate.backup` into the repos.
13. Understand which construct to use when: `locals` vs `tfvars` and `datasource`vs `output`
14. Search best practices: How to setup a remote backend storage account with optimal reduandancy for mission critical software
15. Create project to spawn the Azure Storage account and container for storing the terraform statefiles as remote backend 
16. What are terraform state manipulation commands and what the appropriate uses cases when to use those? 
17. Difference: `terraform apply -refresh-only`  vs `terraform plan -refresh-only`
18. Create some automation to automatically save the outputs into a text file and email it. 
19. Create Module to validate all the resources against the Azure Policies and Naming conventions
20. Briefly understand: How to consume Hashicorp Sentinel Policies
21. Create Own custom External provider to run python scripts in Azure DevOps Pipelines
22. Check out resources on internet how to run terraform in Azure DevOps Pipelines
23. Query: What to do in cases where Lifecycle meta-args prevent_destroy stops proceeding with the plan how to mitigate such changes? 
24. Configuration Drift: How to manage the changes which are done outside the terrform? 
25. What is the purpose of `terrform apply --refresh-only`
26. What is difference between `datasource` and `remote state datasource`

---

## Best practices:
1. Plan how will you manage drift : Immutable Infra or Mutable infra
2. Decide which approch/workflow towards IAC is most suited -  IAC with CICD or IAC with CLI 
3. Categorize the resources into "Once created must not change", "Once created must not detroyed", "Once created will be too frequently changed", "Once created must not be changed or destroyed" 
4. You must version control the `.terraform.tflock.hcl` and `.terraform.tfstate` files along with `.*tf`. And the folder `./.terraform/*` should be stored in remote backend
5. Security: Take good care of `*.tfvars` and `terraform.tfvars` not to leak in SCM or git cache
6. Protect sensititive variables
7. It is always best to reference the location of the resource from the resource group
8. It is always goot to define the required tags separately in file
9. Use terraform workspaces to separate the enviornments 
10. use `*.auto.tfvars` for automatic configurations suhc as for `loadbalancers` or `database` configurations

 
---
## Uses of constructs:
`output` : To record the value as output post creation of resource 
`tfvars` : to pass the values to the variables 
`locals` : define your complex expressions here and use across the project
`datasource` : Create datasources to fetch the data from another projects tfstate files
`remote state datasource`: fetch the the data from the remote tfstate files 

---
## Terraform File Formats
`*.tf`
`*.tfstate.backup`
`.terraform.lock.hcl`
`*.tfvars`
`terraform.tfvars`
`*.auto.tfvars`
`*.tfplan`
`.terraformrc`
`terraform.rc`
`terraform.tfstate.d/*`
`*terraform.tfstateenv:workspacename`
`override.tf`
`*_override.tf`

---
## Terraform project structure:
`main.tf`
`variable.tf`
`outputs.tf`
`versions.tf`
`providers.tf`
`modules/`
`secret.tfvars`
`auto.tfvars`
`terraform.tfvars`
`external providers`

---
## References:
 * HashiCorp Certified: Terraform Associate on Azure - 70  Demos : By [Kalyan Reddy Daida](https://www.udemy.com/course/hashicorp-certified-terraform-associate-on-azure-cloud)
* [stacksimplify/terraform-cloud-azure-demo1](https://github.com/stacksimplify/terraform-cloud-azure-demo1)
* [stacksimplify/terraform-azurerm-staticwebsiteprivate](https://github.com/stacksimplify/terraform-azurerm-staticwebsiteprivate)
* [stacksimplify/terraform-azurerm-staticwebsitepublic](https://github.com/stacksimplify/terraform-azurerm-staticwebsitepublic)

---
## List of azure cli commands used:
* `az account list-locations -otable`
* `az login`
* `az account show -otable` vs `az account list -otable` : whats difference anyways?
* `az account set --sub <subscription id>`
* `az vm list-sizes --location "centralindia"`
* List available SKU `az mysql server list-skus --location southindia -otable`
* `az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID`
* Create Service Principal & Client Secret: 
`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`
* "appId" is the "client_id", "password" is the "client_secret" and "tenant" is the "tenant_id".
* Terraform Cloud ENV Variables to authorize with Azure: 
  ```t
  ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
  ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
  ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
  ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
  ```

---
