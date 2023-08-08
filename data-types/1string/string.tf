variable "sample_string" {
  type        = string
  description = "(optional) describe your variable"
  default     = "samplestring"
}

output "string_output" {
  value = var.sample_string

}