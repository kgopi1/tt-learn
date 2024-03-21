resource "null_resource" "run_python" {
  count = fileexists("test.py") ? 1 : 0
  provisioner "local-exec" {
    command = "python test.py 1 2"
  }
}
