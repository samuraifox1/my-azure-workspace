
resource "random_string" "randomsuffix_5" {
  length = 5
  upper  = false


  special = false
}


resource "random_string" "randomsuffix_8" {
  length  = 8
  upper   = false
  special = false
}

variable "bu_code" {
  description = "Business unit code"
  default     = "bu01"
  sensitive   = false
  type        = string

}

variable "owner_tag" {
  description = "Owner"
  default     = "rswarnka"
  sensitive   = false
  type        = string
}

variable "location" {
  default     = "centralindia"
  description = "Location"
  sensitive   = false
  type        = string
}

