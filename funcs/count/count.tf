variable "file_name" {
  default = "count2.tf"
}

variable "api_public" {
  default = "True"
  type    = string
}

output "run_private_module_due_to_fileexist" {
  value = !fileexists(var.file_name) ? 1 : 0
}

output "run_private_module_due_to_api" {
  value = !(tobool(lower(var.api_public))) ? 1 : 0
}

output "run_private_module" {
  value = !fileexists(var.file_name) && (!(tobool(lower(var.api_public)) && fileexists(var.file_name))) ? 1 : 0
}

output "file_exists" {
  value = fileexists(var.file_name)
}

output "api_public" {
  value = tobool(lower(var.api_public))
}

resource "local_file" "create_file" {
  count    = fileexists(var.file_name) && tobool(lower(var.api_public)) ? 1 : 0
  content  = count.index
  filename = "${count.index}.txt"
}

# resource "local_file" "file2" {
#   for_each = toset(var.local_file)
#   content  = each.value
#   filename = "${each.value}.txt"
# }

# variable "local_file" {
#   type    = list(string)
#   default = ["gopi", "mokshi"]
# }

# output "run_private_module" {
#   value = !fileexists(var.file_name) || !tobool(lower(var.api_public)) || (tobool(lower(var.api_public)) && !fileexists(var.file_name)) ? 1 : 0
# }




