resource "oci_apiaccesscontrol_privileged_api_request" "apiaccesscontrol_privileged_api_requests" {
  for_each = var.apiaccesscontrol_privileged_api_requests

  reason_summary                   = each.value.reason_summary
  resource_id                      = each.value.resource_id
  compartment_id                   = each.value.compartment_id
  defined_tags                     = each.value.defined_tags
  duration_in_hrs                  = each.value.duration_in_hrs
  freeform_tags                    = each.value.freeform_tags
  notification_topic_id            = each.value.notification_topic_id
  reason_detail                    = each.value.reason_detail
  severity                         = each.value.severity
  sub_resource_name_list           = each.value.sub_resource_name_list
  ticket_numbers                   = each.value.ticket_numbers
  time_requested_for_future_access = each.value.time_requested_for_future_access

  dynamic "privileged_operation_list" {
    for_each = each.value.privileged_operation_list
    content {
      api_name        = privileged_operation_list.value.api_name
      attribute_names = privileged_operation_list.value.attribute_names
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

