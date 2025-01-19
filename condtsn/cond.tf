variable "use_token" {
  type = bool
  default = false
}

variable "token_file_name" {
  type = string
  default = ""
}

output "check_token_file" {
  value = (var.token_file_name == "" ) ? false : true
}

locals {

  check_token_file= (var.token_file_name == "" ) ? false : true
}


output "check_token" {
  value = var.use_token
}

output "output2" {
  value = local.check_token_file && var.use_token
}

output "print_output2" {
  value = ((var.token_file_name == "" ) ? false : true ) && var.use_token 
}

output "print_count" {
  value = (((var.token_file_name == "" ) ? false : true ) && var.use_token) ? 1 : 0 
}