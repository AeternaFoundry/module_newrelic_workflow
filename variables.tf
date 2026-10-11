variable "workflows" {
  description = <<EOT
Map of workflows, attributes below
Required:
    - muting_rules_handling
    - name
    - destination (block):
        - channel_id (required)
        - notification_triggers (optional)
        - update_original_message (optional)
    - issues_filter (block):
        - name (required)
        - predicate (optional, block):
            - attribute (required)
            - operator (required)
            - values (required)
        - type (required)
Optional:
    - account_id
    - destinations_enabled
    - enabled
    - enrichments_enabled
    - enrichments (block):
        - nrql (required, block):
            - configuration (required, block):
                - query (required)
            - name (required)
EOT

  type = map(object({
    muting_rules_handling = string
    name                  = string
    account_id            = optional(number)
    destinations_enabled  = optional(bool)
    enabled               = optional(bool)
    enrichments_enabled   = optional(bool)
    destination = list(object({
      channel_id              = string
      notification_triggers   = optional(list(string))
      update_original_message = optional(bool)
    }))
    issues_filter = object({
      name = string
      predicate = optional(list(object({
        attribute = string
        operator  = string
        values    = list(string)
      })))
      type = string
    })
    enrichments = optional(object({
      nrql = list(object({
        configuration = list(object({
          query = string
        }))
        name = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.workflows : (
        length(v.destination) >= 1
      )
    ])
    error_message = "Each destination list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.workflows : (
        v.enrichments == null || (length(v.enrichments.nrql) >= 1)
      )
    ])
    error_message = "Each nrql list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.workflows : (
        v.enrichments == null || (alltrue([for item in v.enrichments.nrql : (length(item.configuration) >= 1)]))
      )
    ])
    error_message = "Each configuration list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

