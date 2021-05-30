variable "key_sample" {
  type        = map(string)
  description = "(optional) describe your variable"
  default = {
    vmname   = "smxmidwinvm01"
    vmsize   = "Standard_D1_v2"
    username = "vmadmin"
  }
}

output "key_output" {
  value = var.key_sample
}

output "key_output_vmname" {
  value = var.key_sample["vmname"]
}

