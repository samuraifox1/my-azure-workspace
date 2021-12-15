
variable "common_tags" {
  type        = map(string)
  description = "Tags"
  default = {
    "owner" = "rswarnkar"
  }
}

resource "random_string" "rand_string" {
  length  = 5
  upper   = false
  number  = false
  special = false

}

variable "location" {
  description = "Location"
  type        = string

  validation {
    condition     = contains(["southindia", "centralindia", "westindia"], var.location)
    error_message = "Resources only allowed in India Regions."
  }

}

variable "dbusername" {
  description = "Database Username"
  type        = string
  sensitive   = true
}

variable "dbpassword" {
  description = "Database Password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Database Name"
  type        = string
  default     = "admin"
}

variable "db_storage_mb" {
  description = "Azure MySQL Database Storage in MB"
  type        = number
  default     = 5120
}

variable "db_auto_grow_enabled" {
  description = "Azure MySQL Database - Enable or Disable Auto Grow Feature"
  type        = bool
}