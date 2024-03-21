# variable "networks" {
#   type = map(object({
#     cidr_block = string
#     subnets    = map(object({ cidr_block = string }))
#   }))
#   default = {
#     "private" = {
#       cidr_block = "10.1.0.0/16"
#       subnets = {
#         "db1" = {
#           cidr_block = "10.1.0.1/16"
#         }
#         "db2" = {
#           cidr_block = "10.1.0.2/16"
#         }
#       }
#     },
#     "public" = {
#       cidr_block = "10.1.1.0/16"
#       subnets = {
#         "webserver" = {
#           cidr_block = "10.1.1.1/16"
#         }
#         "email_server" = {
#           cidr_block = "10.1.1.2/16"
#         }
#       }
#     }
#     "dmz" = {
#       cidr_block = "10.1.2.0/16"
#       subnets = {
#         "firewall" = {
#           cidr_block = "10.1.2.1/16"
#         }
#       }
#     }
#   }
# }



# locals {
#   # flatten ensures that this local value is a flat list of objects, rather
#   # than a list of lists of objects.
#   network_subnets = flatten([
#     for network_key, network in var.networks : [
#       for subnet_key, subnet in network.subnets : {
#         network_key = network_key
#         subnet_key  = subnet_key
#         #network_id  = aws_vpc.example[network_key].id
#         cidr_block = subnet.cidr_block
#       }
#     ]
#   ])
# }

# output "network_subnets" {
#   value = local.network_subnets
# }

