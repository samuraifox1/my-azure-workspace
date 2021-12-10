variable "business_unit_code" {
  description = "Code of the BU"
  default = "bu01"
  sensitive = false
  type = string
}

variable "environment" {
  description = "Name of the environment"
  default = "dev"
  sensitive = false
  type = string
}

variable "owner_tag" {
  description = "Tag value for Onwer"
  default = "rswarnka"
  sensitive = false
  type = string
   
}

variable "purpose_tag" {
  description = "Purpose Tag"
  sensitive = false
  type = string
   
}


variable "created_by_tag" {
  description = "Tag value for created_by"
  default = "terraform"
  sensitive = false
  type = string
  
}