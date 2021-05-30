variable "listsample" {
  type        = list(string)
  description = "(optional) describe your variable"
  default     = ["azure", "aws"]
}

output "list_output_all" {
  value = var.listsample
}

output "list_output1" {
  value = var.listsample[0]
}

output "list_output2" {
  value = var.listsample[1]
}