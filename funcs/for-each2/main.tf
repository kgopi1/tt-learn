# Converting list of maps to map of maps

variable "list_map" {
  default = [
    {
      "name"   = "gopi"
      "age"    = "12"
      "school" = "schoolA"
    },
    {
      "name"   = "mokshi"
      "age"    = "10"
      "school" = "schoolB"
    }
  ]
}

# convert list of maps to map of maps
locals {
  map_map = { for name in var.list_map :
    "${name.name}" => {
      name   = "${name.name}"
      age    = "${name.age}"
      school = "${name.school}"
    }
    if "${name.school}" == "schoolA"

  }
}


output "list_map" {
  value = var.list_map
}

output "map_maps" {
  value = local.map_map

}
