variable "enable_monitoring" {
  type    = bool
  default = false
}

locals {
  enable_monitoring = var.enable_monitoring ? "enabled" : "diabled"
}

output "enable_monitoring" {
  value = local.enable_monitoring
}
