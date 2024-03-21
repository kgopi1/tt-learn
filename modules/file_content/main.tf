resource "local_file" "foo" {
  content  = "foo!"
  filename = var.filename
}

data "template_file" "init" {
  template = file("${path.module}/init.tpl")
  vars = {
    consul_address = "1.2.3.4"
  }
}

# data "local_file" "foo" {
#   filename = "${path.module}/test.txt"
# }

# output "local_file" {
#   value = data.local_file.foo.content
# }

output "path" {
  value = path.module
}
