resource "local_file" "create_file" {
  count    = 2
  content  = count.index
  filename = "${count.index}.txt"
}
