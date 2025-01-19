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


resource "local_file" "local_file" {
  for_each = local.map_map
  filename = each.value.name
  content  = each.value.school

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

# variable "list_map" {

# }
