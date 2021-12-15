## WARNING THIS IS ONLY FOR DEMO PURPOSE
## CRITICAL SECURITY LEAK MIGHT ARISE
dbusername = "azuredbuser"
dbpassword = "AzureAzure#123"

## You need to add IP address to Allow Access via Cloud Shell: 
# Azure Database for MySQL server > Settings > Connection Security > Add IP 
# Allow access to Azure services > Switch to Yes 
# Add Firewall Rules with IP > Click Save
# mysql -h rswarnkardbazoore.mysql.database.azure.com -u azuredbuser@rswarnkardbazoore -pAzureAzure#123
# terraform destroy -var-file="secrets.tfvars" -auto-approve