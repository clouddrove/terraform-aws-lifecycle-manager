provider "aws" {
  region = "eu-west-1"
}

module "lifecycle" {
  source = "./../"

  name        = "lifecycle"
  environment = "test"
  label_order = ["name", "environment"]

  resource_types  = ["INSTANCE"]
  interval        = 24
  interval_unit   = "HOURS"
  times           = ["03:00"]
  count-number    = 44
  SnapshotCreator = "DLM"
  copy_tags       = true
  target_tags = {
    snapshot = "true"
  }

}
