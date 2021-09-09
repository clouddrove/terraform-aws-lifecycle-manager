module "labels" {
  source  = "clouddrove/labels/aws"
  version = "0.15.0"

  name        = var.name
  repository  = var.repository
  environment = var.environment
  managedby   = var.managedby
  attributes  = var.attributes
  label_order = var.label_order
}


resource "aws_iam_role" "dlm_lifecycle_role" {
  count = var.create_lifecycle_policy == true ? 1 : 0
  name = format("%s-role", module.labels.id)

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dlm_lifecycle" {
  count = var.create_lifecycle_policy == true ? 1 : 0
  name = module.labels.id
  role = join("", aws_iam_role.dlm_lifecycle_role.*.id)

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}

resource "aws_dlm_lifecycle_policy" "main" {
  count = var.create_lifecycle_policy == true ? 1 : 0
  description        = "DLM lifecycle policy"
  execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
  state              = "ENABLED"

  policy_details {
    resource_types = var.resource_types

    schedule {
      name = module.labels.id

      create_rule {
        interval      = var.interval
        interval_unit = var.interval_unit
        times         = var.times
      }

      retain_rule {
        count = var.count-number
      }

      tags_to_add = {
        SnapshotCreator = var.SnapshotCreator
      }

      copy_tags = var.copy_tags
    }

    target_tags = var.target_tags
  }
  tags               = module.labels.tags
  tags_all           = module.labels.tags
}