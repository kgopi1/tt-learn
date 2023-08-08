# value passed using input.tfvars
variable "my_pet_name" {
  type        = string
  description = "Pass the vaule using var file as argument"
  default     = "cat"
}

# value passed using terraform.tfvars

variable "what_im_learning_today" {
  type        = string
  description = "Pass the value using Terraform.tfvars"
}

variable "my_env_variable" {
  type        = string
  description = "Pass the value using Environment variable"
}
