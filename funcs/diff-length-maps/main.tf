# variable "containers_list" {
#   type        = any
#   description = "(optional) describe your variable"
#   #   default = {
#   #     get = {
#   #       "operation" : "GET"
#   #       "policy_file" : "testfile"
#   #     }
#   #     post = {
#   #       "operation" : "POST"
#   #     }
#   #   }
#   default = [
#     { name = "blob-1", access_type = "private" },
#     { name = "blob-2", }, #access_type = "blob" },
#     { name = "blob-3", access_type = "container" }
#   ]
# }


# locals {
#   containers_list = { for container in var.containers_list :
#     container.name => {
#       name        = container.name
#       access_type = try(container.access_type, 3)
#     }

#   }
# }

# output "containers_list" {
#   value = local.containers_list
# }
