variable "envs" {
  type = list(string)
  default = [ "dev", "prod" ]
  description = "List of envs"
}

variable "service" {
  type = list(string)
  default = [ "ad", "dns" ]
  description = "List of services"
}

variable "project" {
    type = string
    default = "mango"
    description = "project name"
}


locals {
  env_service = flatten([
    for env in var.envs : [
        for svc in var.service : {
            name = "${env}-${svc}-${var.project}"
            environment = "${env}"
            service = "${svc}"
        }
    ]
  ])
  env_service_count = length(var.envs)+length(var.service)
  env_service_combine = concat(var.envs,var.service)
  env_service_map = { for svc in local.env_service : index(local.env_service,svc) => svc }
}

output "env_service" {
  value = local.env_service
}

output "env_service_count" {
  value = local.env_service_count
}

output "env_service_combine" {
  value = local.env_service_combine
}

output "env_service_map" {
  value = local.env_service_map
}