terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

resource "datadog_monitor" "cpu_percentage_monitor" {
  evaluation_delay           = var.evaluation_delay
  group_retention_duration  = var.group_retention_duration
  new_group_delay           = var.new_group_delay
  notify_audit              = var.notify_audit
  notify_by                 = var.notify_by
  on_missing_data           = var.on_missing_data
  monitor_thresholds {
    critical           = var.critical_threshold
    critical_recovery  = var.critical_recovery
    warning            = var.warning_threshold
    warning_recovery   = var.warning_recovery
  }
  name        = var.name
  type        = var.type
  tags        = var.tags
  priority    = var.priority
  query       = var.query
  message     = var.message
}
