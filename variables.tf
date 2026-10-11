variable "apiaccesscontrol_privileged_api_requests" {
  description = <<EOT
Map of apiaccesscontrol_privileged_api_requests, attributes below
Required:
    - reason_summary
    - resource_id
    - privileged_operation_list (block):
        - api_name (required)
        - attribute_names (optional)
Optional:
    - compartment_id
    - defined_tags
    - duration_in_hrs
    - freeform_tags
    - notification_topic_id
    - reason_detail
    - severity
    - sub_resource_name_list
    - ticket_numbers
    - time_requested_for_future_access
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    reason_summary                   = string
    resource_id                      = string
    compartment_id                   = optional(string)
    defined_tags                     = optional(map(string))
    duration_in_hrs                  = optional(number)
    freeform_tags                    = optional(map(string))
    notification_topic_id            = optional(string)
    reason_detail                    = optional(string)
    severity                         = optional(string)
    sub_resource_name_list           = optional(list(string))
    ticket_numbers                   = optional(list(string))
    time_requested_for_future_access = optional(string)
    privileged_operation_list = list(object({
      api_name        = string
      attribute_names = optional(list(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.apiaccesscontrol_privileged_api_requests : (
        length(v.privileged_operation_list) >= 1
      )
    ])
    error_message = "Each privileged_operation_list list must contain at least 1 items"
  }
}

