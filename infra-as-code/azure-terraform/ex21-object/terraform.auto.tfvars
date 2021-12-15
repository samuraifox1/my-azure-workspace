resource_group_obj = {
  location = "centralindia"
  tags = {
    "tagged from" = "terraform object"
  }

}

/*
 {
  type = object({
    location = string
    tags = map(string)
  })

  default = {
    location = "southindia"
    tags = {
      "owner" = "rswarnka",
      "provision tool" = "terraform"
    }
  }
}

*/