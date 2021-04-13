resource "random_string" "this" {
  upper   = false
  number  = false
  special = false
  length  = 8
}

module "default" {
  source = "../.."

  daemonset_name = "tftest-${random_string.this.result}"
}
