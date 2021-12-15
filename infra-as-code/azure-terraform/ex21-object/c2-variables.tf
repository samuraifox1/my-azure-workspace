
variable "resource_group_obj" {
  type = object({
    location = string
    tags     = map(string)
  })

  default = {
    location = "southindia"
    tags = {
      "owner"          = "rswarnka",
      "provision tool" = "terraform"
    }
  }
}
