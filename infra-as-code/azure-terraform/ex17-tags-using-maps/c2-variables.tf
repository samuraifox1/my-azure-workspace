
resource "random_string" "rand_string" {
  length  = 5
  number  = false
  upper   = false
  special = false
}

variable "mandatory_tags" {
  type = map(string)
  default = {
    "owner"          = "raswrnka"
    "provision tool" = "terraform"
  }
  description = "Mandatory Tags"
}

variable "managed_disk" {
  type = map(number)
  default = {
    "dev"  = 1
    "sit"  = 2
    "prod" = 4 # some random stuff about size of a resource
  }
}