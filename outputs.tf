output "workflows_id" {
  description = "Map of id values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.id }
}
output "workflows_account_id" {
  description = "Map of account_id values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.account_id }
}
output "workflows_destination" {
  description = "Map of destination values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.destination }
}
output "workflows_destinations_enabled" {
  description = "Map of destinations_enabled values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.destinations_enabled }
}
output "workflows_enabled" {
  description = "Map of enabled values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.enabled }
}
output "workflows_enrichments" {
  description = "Map of enrichments values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => one(v.enrichments) }
}
output "workflows_enrichments_enabled" {
  description = "Map of enrichments_enabled values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.enrichments_enabled }
}
output "workflows_guid" {
  description = "Map of guid values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.guid }
}
output "workflows_issues_filter" {
  description = "Map of issues_filter values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => one(v.issues_filter) }
}
output "workflows_last_run" {
  description = "Map of last_run values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.last_run }
}
output "workflows_muting_rules_handling" {
  description = "Map of muting_rules_handling values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.muting_rules_handling }
}
output "workflows_name" {
  description = "Map of name values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.name }
}
output "workflows_workflow_id" {
  description = "Map of workflow_id values across all workflows, keyed the same as var.workflows"
  value       = { for k, v in newrelic_workflow.workflows : k => v.workflow_id }
}

