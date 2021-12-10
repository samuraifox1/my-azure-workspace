/*
Use Case: You need to implicitely as which env user is trying to create 
If its dev it should be created in south india
If its prod it should be created in central india 
If its poc it should be created in west india 
*/

variable "env_type" {
  default     = "dev"
  type        = string
  description = "What kind or env? dev | poc | prod."
}

# variable "list_of_rgs" {
#   type = list(string)
#   default = ["dev", "prod", "poc"]
# }

variable "rg_map" {
  type        = map(string)
  description = "Resource Group Map must not be overridden"
  default = {
    "dev"  = "southindia"
    "prod" = "centralindia"
    "poc"  = "westindia"
  }

}