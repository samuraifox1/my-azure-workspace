resource "random_string" "rand_string" {
  #for_each = list(["dev", "prod", "stage"])
  length  = 6
  special = false
  number  = false
  upper   = false
}

variable "tags" {
  type = object({
    owner       = string
    created_via = string
  })
  default = {
    created_via = "terraform"
    owner       = "rswarnka"
  }
}
