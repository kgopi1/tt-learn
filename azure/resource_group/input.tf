variable "resource_group_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "rg2"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "westeurope"
}

variable "vnet_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "vnet1"

}

variable "vnet_address_space" {
  type        = list
  description = "(optional) describe your variable"
  default     = ["10.0.0.8/24"]
}