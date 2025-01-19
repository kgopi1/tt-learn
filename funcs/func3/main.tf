variable "api_operations" {
  type        = any
  description = "(optional) describe your variable"
  default = {
    get = {
      "operation" : "GET"
      "policy_file" : "testfile"
    }
    post = {
      "operation" : "POST"
    }
  }
}

output "api_operations" {
  value = var.api_operations
}

output "api_operations_policy" {
  value = { for operation, value in var.api_operations :
    operation => value if lookup(value, "policy_file", null) != null

  }
}
