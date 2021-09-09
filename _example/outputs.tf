output "dlm_lifecycle_role_arn" {
  value       = module.lifecycle.dlm_lifecycle_role_arn
  description = " Amazon Resource Name (ARN) of the DLM Lifecycle Policy."
}

output "dlm_lifecycle_role_id" {
  value       = module.lifecycle.dlm_lifecycle_role_id
  description = " Identifier of the DLM Lifecycle Policy."
}
