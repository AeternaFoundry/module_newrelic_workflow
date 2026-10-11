output "workflows_id" {
  description = "Map of id values across all workflows, keyed the same as var.workflows except keys with no id are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.id if v.id != null && length(v.id) > 0 }
}
output "workflows_account_id" {
  description = "Map of account_id values across all workflows, keyed the same as var.workflows except keys with no account_id are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.account_id if v.account_id != null }
}
output "workflows_destination" {
  description = "Map of destination values across all workflows, keyed the same as var.workflows except keys with no destination are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.destination if v.destination != null && length(v.destination) > 0 }
}
output "workflows_destinations_enabled" {
  description = "Map of destinations_enabled values across all workflows, keyed the same as var.workflows except keys with no destinations_enabled are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.destinations_enabled if v.destinations_enabled != null }
}
output "workflows_enabled" {
  description = "Map of enabled values across all workflows, keyed the same as var.workflows except keys with no enabled are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.enabled if v.enabled != null }
}
output "workflows_enrichments" {
  description = "Map of enrichments values across all workflows, keyed the same as var.workflows except keys with no enrichments are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => one(v.enrichments) if v.enrichments != null && length(v.enrichments) > 0 }
}
output "workflows_enrichments_enabled" {
  description = "Map of enrichments_enabled values across all workflows, keyed the same as var.workflows except keys with no enrichments_enabled are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.enrichments_enabled if v.enrichments_enabled != null }
}
output "workflows_guid" {
  description = "Map of guid values across all workflows, keyed the same as var.workflows except keys with no guid are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.guid if v.guid != null && length(v.guid) > 0 }
}
output "workflows_issues_filter" {
  description = "Map of issues_filter values across all workflows, keyed the same as var.workflows except keys with no issues_filter are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => one(v.issues_filter) if v.issues_filter != null && length(v.issues_filter) > 0 }
}
output "workflows_last_run" {
  description = "Map of last_run values across all workflows, keyed the same as var.workflows except keys with no last_run are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.last_run if v.last_run != null && length(v.last_run) > 0 }
}
output "workflows_muting_rules_handling" {
  description = "Map of muting_rules_handling values across all workflows, keyed the same as var.workflows except keys with no muting_rules_handling are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.muting_rules_handling if v.muting_rules_handling != null && length(v.muting_rules_handling) > 0 }
}
output "workflows_name" {
  description = "Map of name values across all workflows, keyed the same as var.workflows except keys with no name are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.name if v.name != null && length(v.name) > 0 }
}
output "workflows_workflow_id" {
  description = "Map of workflow_id values across all workflows, keyed the same as var.workflows except keys with no workflow_id are omitted"
  value       = { for k, v in newrelic_workflow.workflows : k => v.workflow_id if v.workflow_id != null && length(v.workflow_id) > 0 }
}

