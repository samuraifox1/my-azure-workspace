

variable "allowed_location" {

  description = "Location"
  default     = "centralindia"
  type        = string
  validation {
    condition = contains(["southindia", "centralindia", "westindia"], var.allowed_location)
    error_message = "Resource location is only allowed in India regions!"
  }

}


/*

PS H:\R-Local-DataStore\programming\my-azure-workspace\udemy\main> terraform plan -var "allowed_location=eastus" 
╷
│ Error: Invalid value for variable
│
│   on c2-variables.tf line 3:
│    3: variable "allowed_location" {
│
│ Resource location is only allowed in India regions!
│
│ This was checked by the validation rule at c2-variables.tf:8,3-13.

*/