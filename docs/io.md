## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| SnapshotCreator | Policy details for customer values. | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| copy\_tags | tags of false and true. | `string` | `""` | no |
| count-number | How many snapshots to keep. Must be an integer between 1 and 1000. | `number` | `null` | no |
| create\_lifecycle\_policy | Manage Enable or Disable the module. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| interval | How often this lifecycle policy should be evaluated. 1, 2,3,4,6,8,12 or 24 are valid values. | `number` | `null` | no |
| interval\_unit | The unit for how often the lifecycle policy should be evaluated. HOURS is currently the only allowed value and also the default value. | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| policy\_details | Policy details for customer values. | `bool` | `true` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-lifecycle-manager"` | no |
| resource\_types | A list of resource types that should be targeted by the lifecycle policy. VOLUME is currently the only allowed value. | `list(any)` | `[]` | no |
| target\_tags | tags of false and true. | `map(any)` | `{}` | no |
| times | A list of times in 24 hour clock format that sets when the lifecycle policy should be evaluated. Max of 1. | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| dlm\_lifecycle\_role\_arn | Amazon Resource Name (ARN) of the DLM Lifecycle Policy. |
| dlm\_lifecycle\_role\_id | Identifier of the DLM Lifecycle Policy. |

