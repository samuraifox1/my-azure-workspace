
resource "random_string" "randomsuffix_5" {
  length  = 5
  upper   = false
  special = false
}



variable "owner_tag" {
  description = "Owner"
  default     = "rswarnka"
  sensitive   = false
  type        = string
}


variable "replica_locations" {
  type        = list(string)
  default     = ["eastus", "centralindia", "southindia"] ## These must be overridden by auto tfvars
  description = "List of locations"
}


variable "storage_acc_names" {
  type        = list(string)
  default     = ["acc1", "acc2", "acc3"]
  description = "Names of 3 storage accounts"
}