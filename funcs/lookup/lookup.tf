variable "lookup_ex" {
  default = {
    dev  = ["dev", "developement"]
    qa   = ["QA", "Non-Dev"]
    prod = []
  }
  type = object({
    dev  = list(string)
    qa   = list(string)
    prod = list(string)
  })
}

variable "env" {
  default = ""
}

output "env_value" {
  value = lookup(var.lookup_ex, var.env, "prod")
}
