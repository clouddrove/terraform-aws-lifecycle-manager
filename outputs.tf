# Module      : lifycycle manager
# Description : Provides a Data Lifecycle Manager (DLM) lifecycle policy for managing snapshots.

output "dlm_lifecycle_role_arn" {
  value       = join("", aws_iam_role.dlm_lifecycle_role.*.arn)
  description = "Amazon Resource Name (ARN) of the DLM Lifecycle Policy."
}

output "dlm_lifecycle_role_id" {
  value       = join("", aws_iam_role.dlm_lifecycle_role.*.id)
  description = " Identifier of the DLM Lifecycle Policy."
}
