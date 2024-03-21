# terraform {
#   required_providers {
#     scratch = {
#       source  = "BrendanThompson/scratch"
#       version = "0.4.0"
#     }
#   }
# }

# resource "scratch_block" "scratch_block" {
#   dynamic "in" {
#     for_each = var.object
#     content {
#       string = in.value.name
#       number = in.value.school
#     }
#   }
# }

# variable "object" {
#   default = {
#     name = {
#       name   = "gopi"
#       school = 2
#     }
#   }
# }


variable "api_operations" {
  default = {
    get = {
      display_name = "Edit /casefiles/edit/"
      method       = "GET"
    }
    post = {
      display_name = "Sample 123"
      method       = "Post"
      template_parameters = {
        name    = "Id"
        reqired = "true"
      }
    }
  }
}

locals {
  template_parameters = { for template, parameters in var.api_operations : template => try(parameters.template_parameters, null) }
}

output "template_parameters" {
  value = local.template_parameters
}
