resource "newrelic_workflow" "workflows" {
  for_each = var.workflows

  muting_rules_handling = each.value.muting_rules_handling
  name                  = each.value.name
  account_id            = each.value.account_id
  destinations_enabled  = each.value.destinations_enabled
  enabled               = each.value.enabled
  enrichments_enabled   = each.value.enrichments_enabled

  dynamic "destination" {
    for_each = each.value.destination
    content {
      channel_id              = destination.value.channel_id
      notification_triggers   = destination.value.notification_triggers
      update_original_message = destination.value.update_original_message
    }
  }

  issues_filter {
    name = each.value.issues_filter.name
    dynamic "predicate" {
      for_each = each.value.issues_filter.predicate != null ? each.value.issues_filter.predicate : []
      content {
        attribute = predicate.value.attribute
        operator  = predicate.value.operator
        values    = predicate.value.values
      }
    }
    type = each.value.issues_filter.type
  }

  dynamic "enrichments" {
    for_each = each.value.enrichments != null ? [each.value.enrichments] : []
    content {
      dynamic "nrql" {
        for_each = enrichments.value.nrql
        content {
          dynamic "configuration" {
            for_each = nrql.value.configuration
            content {
              query = configuration.value.query
            }
          }
          name = nrql.value.name
        }
      }
    }
  }
}

